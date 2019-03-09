// Generated using Sourcery 0.15.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import XCTest

@testable import ValueCodableTests

// swiftlint:disable trailing_comma
extension UtilsTests {
  static var allTests: [(String, (UtilsTests) -> () throws -> Void)] = [
      ("test_indexMatch", test_indexMatch),
      ("test_findIndex", test_findIndex),
  ]
}
extension ValueCodableTests {
  static var allTests: [(String, (ValueCodableTests) -> () throws -> Void)] = [
      ("test_decodeBasicTypes", test_decodeBasicTypes),
      ("test_encodeBasicTypes", test_encodeBasicTypes),
      ("test_null_json", test_null_json),
      ("test_encode_null", test_encode_null),
      ("test_bool_json", test_bool_json),
      ("test_decodeComplexResponse", test_decodeComplexResponse),
      ("test_key_lookup", test_key_lookup),
      ("test_key_lookup_nested", test_key_lookup_nested),
      ("test_array_indexing", test_array_indexing),
  ]
}

XCTMain([
  testCase(UtilsTests.allTests),
  testCase(ValueCodableTests.allTests),
])
// swiftlint:enable trailing_comma
