import Foundation
import AsyncHTTPClient

public struct AssignmentEndpoint {
    var token: String
    private var decoder: JSONDecoder = JSONDecoder()
    
    public init(token: String) {
        self.token = token
        self.decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    public func GetAssignments(for course: Int, with client: HTTPClient) -> Result<[Assignment], Error> {
        do {
            var request = try HTTPClient.Request(
                    url: Endpoint(path: "api/v1/courses/\(course)/assignments", hostSubDomain: "gatech").url.absoluteString,
                    method: .GET,
                    body: nil)
            request.headers.add(name: "Authorization", value: "Bearer \(self.token)")
            
            let response = try client.execute(request: request).wait()
            guard let body = response.body else { fatalError() }
            
            let assignment = try self.decoder.decode([Assignment].self, from: body)
            return .success(assignment)
        } catch(let err) {
            return .failure(err)
        }
    }
}
