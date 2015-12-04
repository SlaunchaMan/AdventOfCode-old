//: Playground - noun: a place where people can play

import Cocoa

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

print(Day2Result)

let Day2Part2Example1 = BoxSize(string: "2x3x4")?.requiredRibbonLength
let Day2Part2Example2 = BoxSize(string: "1x1x10")?.requiredRibbonLength

let Day2Part2Result = Day2Input.characters.split { $0 == "\n" }
    .flatMap(String.init)
    .flatMap(BoxSize.init)
    .reduce(0) { $0 + $1.requiredRibbonLength }

print(Day2Part2Result)

let Day3Example1 = DeliverPresents(">")
let Day3Example2 = DeliverPresents("^>v<")
let Day3Example3 = DeliverPresents("^v^v^v^v^v")

// How many houses get at least one present?
let Day3Result = DeliverPresents(Day3Input).count

let Day3Part2Example1 = DeliverPresents(Day3Input, numberOfSantas: 2).count
