import Foundation

public func endingFloorFromInput(input: String, startingFloor: Int = 0) -> Int {
    return startingFloor +
        input.characters.filter { $0 == "(" }.count -
        input.characters.filter { $0 == ")" }.count
}

public func firstPositionMatchingFloor(targetFloor: Int,
    input: String,
    startingFloor: Int = 0) -> Int? {
        var currentFloor = startingFloor
        var index: Int? = nil
        
        let string = input as NSString
        let stringLength = string.length
        
        for i in 0 ..<  stringLength {
            let c = Character(UnicodeScalar(string.characterAtIndex(i)))
            
            currentFloor = endingFloorFromInput(String(c),
                startingFloor: currentFloor)
            
            if currentFloor == targetFloor {
                index = i
                break;
            }
        }
        
        return index
}

public let Day1Input: String = try! String(contentsOfFile: NSBundle.mainBundle().pathForResource("Day1Input", ofType: "txt")!)

