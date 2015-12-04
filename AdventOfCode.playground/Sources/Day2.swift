import Foundation

public struct BoxSize {
    public let width: Int
    public let height: Int
    public let length: Int
    
    public init?(string: String) {
        let parameters = string.characters.split { $0 == "x" }.flatMap(String.init)
        
        guard parameters.count == 3,
            let width = Int(parameters[0]),
            height = Int(parameters[1]),
            length = Int(parameters[2]) else {
                self.width = 0
                self.height = 0
                self.length = 0
                
                return nil
        }
        
        self.width = width
        self.height = height
        self.length = length
    }
    
    public var requiredPaperSize: Int {
        return (2 * length * width) +
            (2 * width * height) +
            (2 * length * height) +
            min(length * width, width * height, length * height)
    }
    
    public var requiredRibbonLength: Int {
        return (length * width * height) +
            (2 * min(length + width, width + height, length + height))
    }
}

public let Day2Input: String = try! String(contentsOfFile: NSBundle.mainBundle().pathForResource("Day2Input", ofType: "txt")!)
