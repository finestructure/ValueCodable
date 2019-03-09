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
        XCTAssertEqual(indexMatch("a[0]")?.keyPath, "a")
        XCTAssertEqual(indexMatch("a[0]")?.index, "0")

        XCTAssertEqual(indexMatch("a12[-123]")?.keyPath, "a12")
        XCTAssertEqual(indexMatch("a12[-123]")?.index, "-123")

        XCTAssertEqual(indexMatch("_a[0]")?.keyPath, "_a")
        XCTAssertEqual(indexMatch("a_[0]")?.keyPath, "a_")

        XCTAssertNil(indexMatch("a [0]"))
        XCTAssertEqual(indexMatch(" a[0]")?.keyPath, "a")

        XCTAssertNil(indexMatch("a[]"))
    }

    func test_splitIndex() throws {
        XCTAssertEqual(splitIndex("a[0]")?.keyPath, "a")
        XCTAssertEqual(splitIndex("a[0]")?.index, 0)
        XCTAssertEqual(splitIndex("a[12]")?.index, 12)
        XCTAssertEqual(splitIndex("a[-1]")?.index, -1)
    }

}
