//
//  Math.swift
//  Math
//
//  Created by Kishikawa Katsumi on 9/1/16.
//  Copyright © 2016 Kishikawa Katsumi. All rights reserved.
//

struct Symbols {
    static let minus = "\u{2212}"
    static let plusMinus = "\u{00B1}"
    static let squareRoot = "\u{221A}"
    static let smallSigma = "\u{1D70E}"
    static let smallMu = "\u{1D707}"
    static let summation = "\u{2211}"
    static let horizontalLine = "\u{2500}"
}

func italicized(ch: UnicodeScalar) -> UnicodeScalar {
    if ch == "h" {
        return "\u{210E}" // PLANCK CONSTANT
    } else if ch >= "a" && ch <= "z" {
        return UnicodeScalar("\u{1D44E}".unicodeScalars.first!.value + (ch.value - "a".unicodeScalars.first!.value))
    } else if ch >= "A" && ch <= "Z" {
        return UnicodeScalar("\u{1D434}".unicodeScalars.first!.value + (ch.value - "A".unicodeScalars.first!.value))
    } else if ch >= "\u{03B1}" && ch <= "\u{03C9}" {
        return UnicodeScalar("\u{1D6FC}".unicodeScalars.first!.value + (ch.value - "\u{03B1}".unicodeScalars.first!.value))
    } else if ch >= "\u{0391}" && ch <= "\u{03A9}" {
        return UnicodeScalar("\u{1D6E2}".unicodeScalars.first!.value + (ch.value - "\u{0391}".unicodeScalars.first!.value))
    } else {
        return ch
    }
}

func variable(text: String) -> String {
    var s = ""
    for unicodeScalar in text.unicodeScalars {
        s.append(italicized(unicodeScalar))
    }
    return s
}

func expression(expression: String) -> String {
    return variable(
        expression
            .stringByReplacingOccurrencesOfString("\\sqrt", withString: Symbols.squareRoot)
            .stringByReplacingOccurrencesOfString("\\pm", withString: Symbols.plusMinus)
            .stringByReplacingOccurrencesOfString("\\mu", withString: Symbols.smallMu)
            .stringByReplacingOccurrencesOfString("\\sigma", withString: Symbols.smallSigma)
            .stringByReplacingOccurrencesOfString("\\sum_", withString: Symbols.summation)
            .stringByReplacingOccurrencesOfString("-", withString: Symbols.minus)
    )
}
