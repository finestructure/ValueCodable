import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(FSValueTests.allTests),
    ]
}
#endif