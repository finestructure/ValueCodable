//
//  UtilsTests.swift
//  ValueCodableTests
//
//  Created by Sven A. Schmidt on 09/03/2019.
//

import XCTest

@testable import ValueCodable


class UtilsTests: XCTestCase {

    func test_indexMatch() throws {
        XCTAssertEqual(indexMatch("a[0]"), "0")
        XCTAssertEqual(indexMatch("a[12]"), "12")
        XCTAssertEqual(indexMatch("a[-1]"), "-1")
    }

    func test_findIndex() throws {
        XCTAssertEqual(findIndex("a[0]"), 0)
        XCTAssertEqual(findIndex("a[12]"), 12)
        XCTAssertEqual(findIndex("a[-1]"), -1)
    }

}
