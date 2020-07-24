import NIO
import Foundation
import AsyncHTTPClient

public struct AssignmentEndpoint {
    var token: String
    private var decoder: JSONDecoder = JSONDecoder()
    
    public init(token: String) {
        self.token = token
        self.decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    public func getAssignments(for course: Int, with client: HTTPClient) throws -> EventLoopFuture<[Assignment]> {
        var request = try HTTPClient.Request(
                url: Endpoint(path: "api/v1/courses/\(course)/assignments", hostSubDomain: "gatech").url.absoluteString,
                method: .GET,
                body: nil)
        request.headers.add(name: "Authorization", value: "Bearer \(self.token)")
        
        return client
            .execute(request: request)
            .flatMapThrowing { response in
                guard let body = response.body else { throw ClientErrors.DecodeResponseBody }
                return try self.decoder.decode([Assignment].self, from: body)
            }
    }
}
