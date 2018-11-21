public extension CGPoint {
    
    public init(polarAngle: CGFloat, length: CGFloat) {
        self.x = cos(polarAngle) * (length)
        self.y = sin(polarAngle) * -(length)
    }
    
}