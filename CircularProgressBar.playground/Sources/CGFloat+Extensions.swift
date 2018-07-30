import CoreGraphics

public extension CGFloat {
    
    // Converts degrees to radians
    public func degreesToRadians() -> CGFloat {
        return CGFloat.pi * self / 180.0
    }
    
}
