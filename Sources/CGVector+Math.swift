/*
 
 erica sadun, ericasadun.com
 Core Geometry
 
 */

import Foundation
import QuartzCore

extension CGVector {
    
    // MARK: Magnitude
    
    /// Returns magnitude
    public var magnitude: CGFloat {
        return hypot(dx, dy)
    }
    
    // MARK: Unit Vector
    
    /// Returns unit vector
    public var unitForm: CGVector {
        return CGVector(dx: dx / magnitude, dy: dy / magnitude)
    }
    
}

extension CGVector {

    // MARK: Scaling
    
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
    
    // MARK: Vector addition and subtraction
    
    /// Adds two vectors
    public static func + (v1: CGVector, v2: CGVector) -> CGVector {
        return CGVector(dx: v1.dx + v2.dx, dy: v1.dy + v2.dy)
    }
    
    /// Vector subtraction
    public static func - (v1: CGVector, v2: CGVector) -> CGVector {
        return CGVector(dx: v1.dx - v2.dx, dy: v1.dy - v2.dy)
    }
    
    // MARK: Negation
    
    /// Returns negative extents
    public func negated() -> CGVector {
        return CGVector(dx: -dx, dy: -dy)
    }
    
    /// Returns RHS/CCW perpendicular
    public func rhperpendicular() -> CGVector {
        return CGVector(dx: -dy, dy: dx)
    }
    
    /// Returns LHS/CW perpendicular
    public func lhperpendicular() -> CGVector {
        return CGVector(dx: dy, dy: -dx)
    }

    /// Returns (RHS, CCW) perpendicular
    public func perpendicular() -> CGVector {
        return rhperpendicular()
    }
    
    /// Negation
    public static prefix func - (vector: CGVector) -> CGVector {
        return vector.negated()
    }
}

infix operator **

extension CGVector {

    // MARK: Dot Product
    
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
