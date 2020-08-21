[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Ffinestructure%2FValueCodable%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/finestructure/ValueCodable)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Ffinestructure%2FValueCodable%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/finestructure/ValueCodable)

# ValueCodable

[![Build Status](https://travis-ci.com/finestructure/ValueCodable.svg?branch=develop)](https://travis-ci.com/finestructure/ValueCodable)

ValueCodable is a swift library to decode data of unknown structure in a type safe way.

For instance, say you have a yml file with the following content

```
name: foo
data:
    obj:
        a: 1
        b: two
    list:
        - 1
        - two
        - foo: bar
```

where the format of `data` is unknown beforehand. It is not straightforward to write a decoder for the arbitrary data structure.

Whith `ValueCodable`, the decoding is quite simple:

```
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
```

## Supported types

`Value` currently supports the following types:

```
public enum Value: Equatable {
    case bool(Bool)
    case int(Int)
    case string(String)
    case double(Double)
    case dictionary([Key: Value])
    case array([Value])
    case null
}
```

When decoding, `ValueCodable` will attempt to decode into the most suitable type.
