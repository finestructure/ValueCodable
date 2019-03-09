//
//  Utils.swift
//  ValueCodable
//
//  Created by Sven A. Schmidt on 09/03/2019.
//

import Foundation


func indexMatch(_ string: String) -> String? {
    let regex = "\\[(-?\\d+)\\]"
    guard let re = try? NSRegularExpression(pattern: regex) else { return nil }
    let matches = re.matches(in: string, range: NSRange(string.startIndex..., in: string))

    for match in matches {
        // range at index 0: full match
        // range at index 1: first capture group
        guard let range = Range(match.range(at: 1), in: string) else { return nil }
        return String(string[range])
    }
    return nil
}


func findIndex(_ string: String) -> Int? {
    guard let indexString = indexMatch(string) else { return nil }
    return Int(indexString)
}
