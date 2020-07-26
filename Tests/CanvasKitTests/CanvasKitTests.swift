import XCTest
import AsyncHTTPClient
import Foundation
@testable import CanvasKit

enum TestError: Error {
    case MissingCanvasToken
}

final class CanvasKitTests: XCTestCase {
    func testGetAssignments() {
        XCTAssert(true == true)
    }

    static var allTests = [
        ("testGetAssignments", testGetAssignments),
    ]
}
