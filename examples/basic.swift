#!/usr/bin/swift sh
import ValueCodable  // @finestructure ~> 0.0.2
import Yams          // @jpsim

let s = """
    name: foo
    data:
        obj:
            a: 1
            b: two
        list:
            - 1
            - two
            - foo: bar
    """

struct Test: Decodable {
    let name: String
    // capture the unstructure data as "Value"
    let data: Value
}

let t = try YAMLDecoder().decode(Test.self, from: s)

// access "data" via subscript
print(t.data["obj"])       // Optional(["a": 1, "b": "two"])
print(t.data["list"])      // Optional([1, "two", ["foo": "bar"]])
print(t.data["list"]?[0])  // Optional(1)

// act on the decoded types
switch t.data["list"]?[2] {
case let .some(.dictionary(dict)):
    print(dict)            // ["foo": "bar"]
default:
    print("unhandled type")
}

// access propertyies via key paths
print(t.data["obj.b"])         // Optional("two")
print(t.data["list[0]"])       // Optional(1)
print(t.data["list[2].foo"])   // Optional("bar")
