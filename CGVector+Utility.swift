/*
 
 erica sadun, ericasadun.com
 Core Geometry Math
 
 */

import Foundation
import QuartzCore

// Vectors
extension CGVector {
    /// Returns magnitude
    public var magnitude: CGFloat {
        return hypot(dx, dy)
    }
    
    /// Returns unit vector
    public var unitForm: CGVector {
        return CGVector(dx: dx / magnitude, dy: dy / magnitude)
    }
    
    /// Return negative extents
    public func negated() -> CGVector {
        return CGVector(dx: -dx, dy: -dy)
    }

    /// Multiplies vector by scale
    public static func * (vector: CGVector, scale: CGFloat) -> CGVector {
        return CGVector(dx: vector.dx * scale, dy: vector.dy * scale)
    }
    
    /// Divides vector by scale
    public static func / (vector: CGVector, scale: CGFloat) -> CGVector {
        return CGVector(dx: vector.dx / scale, dy: vector.dy / scale)
    }
    
    /// Adds two vectors
    public static func + (v1: CGVector, v2: CGVector) -> CGVector {
        return CGVector(dx: v1.dx + v2.dx, dy: v1.dy + v2.dy)
    }
    
    /// Vector subtraction
    public static func - (v1: CGVector, v2: CGVector) -> CGVector {
        return CGVector(dx: v1.dx - v2.dx, dy: v1.dy - v2.dy)
    }
    
    /// Negation
    public static prefix func - (vector: CGVector) -> CGVector {
        return vector.negated()
    }
    
    /// Returns dot product of two vectors
    public static func * (lhs: CGVector, rhs: CGVector) -> CGFloat {
        let dot: CGFloat = (lhs.dx * rhs.dx) + (lhs.dy * rhs.dy)
        return dot
    }
}

infix operator **

extension CGVector {
    /// Returns unnormalized dot product of two vectors
    public static func dotProduct (_ v1: CGVector, _ v2: CGVector) -> CGFloat {
        return (v1.dx * v2.dx) + (v1.dy * v2.dy)
    }

    /// Returns unit dot product of two vectors
    public static func ** (v1: CGVector, v2: CGVector) -> CGFloat {
        return dotProduct(v1, v2) / (v1.magnitude * v2.magnitude)
    }
}
