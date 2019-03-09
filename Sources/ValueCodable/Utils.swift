//
//  Utils.swift
//  ValueCodable
//
//  Created by Sven A. Schmidt on 09/03/2019.
//

import Foundation


func indexMatch(_ string: String) -> (keyPath: String, index: String)? {
    let regex = "([^\\s]+)\\[(-?\\d+)\\]"
    guard let re = try? NSRegularExpression(pattern: regex) else { return nil }
    let matches = re.matches(in: string, range: NSRange(string.startIndex..., in: string))

    for match in matches {
        // index 0: full match
        // index 1: first capture group
        // index 2: second capture group
        guard
            let r1 = Range(match.range(at: 1), in: string),
            let r2 = Range(match.range(at: 2), in: string)
            else { return nil }
        return (String(string[r1]), String(string[r2]))
    }
    return nil
}


func splitIndex(_ string: String) -> (keyPath: String, index: Int)? {
    guard
        let res = indexMatch(string),
        let index = Int(res.index)
        else { return nil }
    return (res.keyPath, index)
}
