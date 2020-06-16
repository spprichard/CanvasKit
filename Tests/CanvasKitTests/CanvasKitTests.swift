import XCTest
import AsyncHTTPClient
import Foundation
@testable import CanvasKit

enum TestError: Error {
    case MissingCanvasToken
}

final class CanvasKitTests: XCTestCase {
    func testGetAssignments() {
        let client = HTTPClient(eventLoopGroupProvider: .createNew)
        guard let canvasToken = ProcessInfo.processInfo.environment["CANVAS_TOKEN"] else { fatalError() }
        guard let canvasCourseID = Int(ProcessInfo.processInfo.environment["CANVAS_COURSE_ID"]!) else { fatalError() }
        let endpoint = AssignmentEndpoint(token: canvasToken)
        
        let assignmentResults = endpoint.GetAssignments(for: canvasCourseID, with: client)
        switch assignmentResults {
        case .success(let assignments):
            XCTAssert(assignments.count > 0)
        case .failure(let err):
            XCTAssertNil(err, "Expected error to be nil, got: \(err)")
        }

        XCTAssertNoThrow(try client.syncShutdown())
    }

    static var allTests = [
        ("testGetAssignments", testGetAssignments),
    ]
}
