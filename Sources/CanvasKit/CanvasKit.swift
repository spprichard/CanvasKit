import NIO
import Foundation
import AsyncHTTPClient

enum ClientErrors : Error {
    case NotImplmented
}

struct CanvasKitClient {
    var client = HTTPClient(eventLoopGroupProvider: .createNew)
    var decoder = JSONDecoder()
    var token: String = "2096~R1MJjSejkhTZU0OKJKpeoFZRNTPmPHyPcUxLSaTKWYyKxSZpKje5Dudc6q3uDLQN"
    
    
    public func GetAssignments() throws -> [Assignment] {
        var request = try HTTPClient.Request(
            url: "https://canvas.instructure.com/api/v1/courses/20960000000116872/assignments.json",
            method: .GET,
            body: nil)
        request.headers.add(name: "Authorization", value: "Bearer \(self.token)")
    
        let response = try self.client.execute(request: request).wait()
        guard let body = response.body else { fatalError() }

        self.decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try self.decoder.decode([Assignment].self, from: body)
    }

    
    public func Shutdown() throws {
        try self.client.syncShutdown()
    }
    
//    public func GetAssignments() throws -> [Assignment] {
//        let response = try self.client.get(url: "/api/v1/courses/116872/assignments").wait()
//        guard let body = response.body else { fatalError() }
//
//        let assignments = try self.decoder.decode([Assignment].self, from: body)
//        print(assignments)
//
//        return assignments
//    }
    
}

    
