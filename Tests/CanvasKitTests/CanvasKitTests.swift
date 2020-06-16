import XCTest
@testable import CanvasKit

final class CanvasKitTests: XCTestCase {
    func testGetAssignments() {
        let client = CanvasKitClient()
        
        do {
            let assignments = try client.GetAssignments()
            print(assignments)
            XCTAssertTrue(assignments.count != 0)
        } catch(let error) {
            XCTAssertNil(error)
        }
        
        XCTAssertNoThrow(try client.Shutdown())
    }

    static var allTests = [
        ("testGetAssignments", testGetAssignments),
    ]
}
