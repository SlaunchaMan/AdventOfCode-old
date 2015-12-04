import Foundation

enum MoveDirection: String {
    case North = "^"
    case East  = ">"
    case South = "v"
    case West  = "<"
}

public struct HouseLocation {
    private(set) var x: Int
    private(set) var y: Int
    
    mutating func move(direction: MoveDirection) {
        switch direction {
        case .North:
            y -= 1
        case .South:
            y += 1
        case .East:
            x += 1
        case .West:
            x -= 1
        }
    }
}

public func ==(lhs: HouseLocation, rhs: HouseLocation) -> Bool {
    return lhs.x == rhs.x && lhs.y == rhs.y
}

extension String {
    init(houseLocation: HouseLocation) {
        self.init("\(houseLocation.x), \(houseLocation.y)")
    }
}

extension HouseLocation: Hashable {
    public var hashValue: Int {
        return String(self).hashValue
    }
}

private func DeliverPresentTo(location: HouseLocation, inout storage: [HouseLocation: Int]) {
    if let startingValue = storage[location] {
        storage[location] = startingValue + 1
    }
    else {
        storage[location] = 1
    }
}

public func DeliverPresents(input: String, numberOfSantas: Int = 1) -> [HouseLocation: Int] {
    // All Santas start at the same location
    var currentHouseLocations: [HouseLocation] =
    Array<HouseLocation>(count: numberOfSantas,
        repeatedValue: HouseLocation(x: 0, y: 0))
    
    let string = input as NSString
    let stringLength = string.length
    
    var presents: [HouseLocation: Int] = [:]
    
    // All Santas deliver a present to the initial house
    for i in 0 ..< numberOfSantas {
        DeliverPresentTo(currentHouseLocations[i], storage: &presents)
    }
    
    for i in 0 ..<  stringLength {
        let santaIndex = i % numberOfSantas
        
        if let direction = MoveDirection(rawValue:
            String(UnicodeScalar(string.characterAtIndex(i)))) {
                currentHouseLocations[santaIndex].move(direction)
                
                DeliverPresentTo(currentHouseLocations[santaIndex],
                    storage: &presents)
        }
    }
    
    return presents
}

public let Day3Input: String = try! String(contentsOfFile: NSBundle.mainBundle().pathForResource("Day3Input", ofType: "txt")!)