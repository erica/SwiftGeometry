/*
 
 erica sadun, ericasadun.com
 Core Geometry Math
 
 */

import Foundation
import QuartzCore

// Vectors

public extension CGVector {
    /// Returns magnitude
    public var magnitude: CGFloat {
        return hypot(dx, dy)
    }
    
    /// Returns unit vector
    public var unitForm: CGVector {
        return CGVector(dx: dx / magnitude, dy: dy / magnitude)
    }
    
    /// Returns point representation
    public var pointForm: CGPoint {
        return CGPoint(x: dx, y: dy)
    }
    
    /// Returns size representation
    public var sizeForm: CGSize {
        return CGSize(width: dx, height: dy)
    }
}

/// Multiplies vector by scale
public func * (vector: CGVector, scale: CGFloat) -> CGVector {
    return CGVector(dx: vector.dx * scale, dy: vector.dy * scale)
}

/// Divides vector by scale
public func / (vector: CGVector, scale: CGFloat) -> CGVector {
    return CGVector(dx: vector.dx / scale, dy: vector.dy / scale)
}

/// Adds two vectors
public func + (v1: CGVector, v2: CGVector) -> CGVector {
    return CGVector(dx: v1.dx + v2.dx, dy: v1.dy + v2.dy)
}

/// Vector subtraction
public func - (v1: CGVector, v2: CGVector) -> CGVector {
    return CGVector(dx: v1.dx - v2.dx, dy: v1.dy - v2.dy)
}

// Dot product

/// Returns dot product of two vectors
public func * (lhs: CGVector, rhs: CGVector) -> CGFloat {
    let dot: CGFloat = (lhs.dx * rhs.dx) + (lhs.dy * rhs.dy)
    return dot
}

infix operator ** // normalized

/// Returns unit dot product of two vectors
public func ** (lhs: CGVector, rhs: CGVector) -> CGFloat {
    var dot: CGFloat = (lhs.dx * rhs.dx) + (lhs.dy * rhs.dy)
    dot /= (lhs.magnitude * rhs.magnitude)
    return dot
}
