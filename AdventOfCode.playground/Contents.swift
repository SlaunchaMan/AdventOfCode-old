//: Playground - noun: a place where people can play

import Foundation
import MD5Digest

let Day1Examples = ["(())", "()()", "(((", "(()(()(", "))(((((", "())", "))(", ")))", ")())())"]
    .map { "The input \($0) results in floor \(endingFloorFromInput($0))" }
    .joinWithSeparator("\n")

let Day1Part2Examples = [")", "()())"]
    .map { "The input \($0) results in position \(firstPositionMatchingFloor(-1, input: $0)! + 1)" }
    .joinWithSeparator("\n")

let Day1Result = endingFloorFromInput(Day1Input)
let Day1Part2Result = firstPositionMatchingFloor(-1, input: Day1Input)

let Day2Example1 = BoxSize(string: "2x3x4")?.requiredPaperSize
let Day2Example2 = BoxSize(string: "1x1x10")?.requiredPaperSize

let Day2Result = Day2Input.characters.split { $0 == "\n" }
    .flatMap(String.init)
    .flatMap(BoxSize.init)
    .reduce(0) { $0 + $1.requiredPaperSize }

Day2Result

let Day2Part2Example1 = BoxSize(string: "2x3x4")?.requiredRibbonLength
let Day2Part2Example2 = BoxSize(string: "1x1x10")?.requiredRibbonLength

let Day2Part2Result = Day2Input.characters.split { $0 == "\n" }
    .flatMap(String.init)
    .flatMap(BoxSize.init)
    .reduce(0) { $0 + $1.requiredRibbonLength }

Day2Part2Result

let Day3Example1 = DeliverPresents(">")
let Day3Example2 = DeliverPresents("^>v<")
let Day3Example3 = DeliverPresents("^v^v^v^v^v")

// How many houses get at least one present?
let Day3Result = DeliverPresents(Day3Input).count

let Day3Part2Example1 = DeliverPresents(Day3Input, numberOfSantas: 2).count

// Day 4 has to be in this file, thanks to rdar://23756130. May move
// to pages instead.
let Day4Input = "yzbqklnj"

func AdventCoinNumber(input: String, numberOfZeros zeros: Int = 5) -> Int? {
    let prefix = Array<String>(count: zeros, repeatedValue: "0")
        .joinWithSeparator("")
    
    for i in 0 ..< Int.max {
        let candidate = (input + String(i)) as NSString
        let candidateHash = candidate.MD5Digest()
        if candidateHash.hasPrefix(prefix) {
            return i
        }
    }
    
    return nil
}

//let Day4Example1 = AdventCoinNumber("abcdef")
//let Day4Example2 = AdventCoinNumber("pqrstuv")

//let Day4Result = AdventCoinNumber(Day4Input)
//let Day4Part2Result = AdventCoinNumber(Day4Input, numberOfZeros: 6)
