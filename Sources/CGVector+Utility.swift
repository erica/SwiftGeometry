/*
 
 erica sadun, ericasadun.com
 Core Geometry Math
 
 */

import Foundation
import QuartzCore

infix operator **

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

    /// Multiplies vector by factor
    public static func * (vector: CGVector, factor: CGFloat) -> CGVector {
        return CGVector(dx: vector.dx * factor, dy: vector.dy * factor)
    }
    
    /// Multiplies vector by scale
    public static func * (vector: CGVector, scale: CGScale) -> CGVector {
        return CGVector(dx: vector.dx * scale.sx, dy: vector.dy * scale.sy)
    }
    
    /// Divides vector by factor
    public static func / (vector: CGVector, factor: CGFloat) -> CGVector {
        return CGVector(dx: vector.dx / factor, dy: vector.dy / factor)
    }
    
    /// Divides vector by scale
    public static func / (vector: CGVector, scale: CGScale) -> CGVector {
        return CGVector(dx: vector.dx / scale.sy, dy: vector.dy / scale.sx)
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
    public static func * (v1: CGVector, v2: CGVector) -> CGFloat {
        let dot: CGFloat = (v1.dx * v2.dx) + (v1.dy * v2.dy)
        return dot
    }

    /// Returns unit dot product of two vectors
    public static func ** (v1: CGVector, v2: CGVector) -> CGFloat {
        return (v1 * v2) / (v1.magnitude * v2.magnitude)
    }
}
