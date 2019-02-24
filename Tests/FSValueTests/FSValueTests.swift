import XCTest
@testable import FSValue

final class FSValueTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(FSValue().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
