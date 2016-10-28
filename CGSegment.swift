/*
 
 erica sadun, ericasadun.com
 line segment geometry
 
 */

import Foundation
import QuartzCore


// Line segments

public struct CGSegment {
    
    /// Initialize with two points
    public init(p1: CGPoint, p2: CGPoint) {
        (self.p1, self.p2) = (p1, p2)
    }
    
    /// Initialize with a point and a vector
    public init(point: CGPoint, vector: CGVector) {
        (self.p1, self.p2) = (point, point + vector)
    }
    
    /// Default initializer
    public init() { (self.p1, self.p2) = (.zero, .zero) }
    
    /// Store two endpoints
    public var (p1, p2): (CGPoint, CGPoint)
    
    /// Returns segment dy
    public var dy: CGFloat { return p2.y - p1.y }
    
    /// Returns segment dx
    public var dx: CGFloat { return p2.x - p1.x }

    /// Returns the segment slope
    public var slope: CGFloat { return dy / dx }
    
    /// Returns the segment length
    public var length: CGFloat { return hypot(dx, dy) }
    
    /// Returns vector representation
    public var vector: CGVector { return p2 - p1 }
}

