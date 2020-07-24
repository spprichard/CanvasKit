import Foundation
import AsyncHTTPClient
import NIO

struct Student: Codable {
    var id: Int
}

public struct UserEndpoint {
    var token: String
    private var decoder: JSONDecoder = JSONDecoder()
    
    public init(token: String) {
        self.token = token
    }
    
    private func constructUserRequest(for course: Int, onlyStudents: Bool) throws -> HTTPClient.Request {
        var endpoint = Endpoint(path: "api/v1/courses/\(course)/users", hostSubDomain: "gatech")
        
        if onlyStudents {
            endpoint = endpoint.with(params: [URLQueryItem(name: "enrollment_type", value: "student")])
        }
        
        var request = try HTTPClient.Request(
            url: endpoint.url.absoluteString,
            method: .GET,
            body: nil
        )
        request.headers.add(name: "Authorization", value: "Bearer \(self.token)")
        request.headers.add(name: "Content-Type", value: "application/json")
        return request
    }
    
    public func getUsers(for course: Int, with client: HTTPClient) throws ->  EventLoopFuture<[User]> {
        let req = try self.constructUserRequest(for: course, onlyStudents: false)

        return client
            .execute(request: req)
            .flatMapThrowing { response in
                guard let body = response.body else { throw ClientErrors.DecodeResponseBody }
                return try self.decoder.decode([User].self, from: body)
            }
    }
    
    public func getStudents(for course: Int, with client: HTTPClient) throws -> EventLoopFuture<[User]> {
        let req = try self.constructUserRequest(for: course, onlyStudents: true)
        
        return client
            .execute(request: req)
            .flatMapThrowing { response in
                guard let body = response.body else { throw ClientErrors.DecodeResponseBody }
                return try self.decoder.decode([User].self, from: body)
            }
    }
}
