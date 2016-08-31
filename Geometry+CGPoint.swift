/*
 
 erica sadun, ericasadun.com
 Core Geometry Math
 
 */

import Foundation
import QuartzCore


// Points

public extension CGPoint {
    /// Returns vector representation
    public var vectorForm: CGVector { return CGVector(dx: x, dy: y) }
    
    /// Returns size representation
    public var sizeForm: CGSize { return CGSize(width: x, height: y) }
    
    // Returns rectangle representation
    public var rectForm: CGRect { return CGRect(origin: self, size: .zero) }
    
    /// Returns negative extents
    public var negative: CGPoint { return CGPoint(x: -x, y: -y) }
    
    /// Unlabeled initializer
    public init(_ x: CGFloat, _ y: CGFloat) { (self.x, self.y) = (x, y) }
}

// Point
public extension CGPoint {
    /// Returns integral version
    /// Thanks Mike Ash for the floor workaround
    public var integral: CGPoint {
        return CGPoint(
            x: CoreGraphics.floor(x),
            y: CoreGraphics.floor(y))
    }
    
    /// Returns max position
    public var max: CGFloat { return fmax(x, y) }
    
    /// Returns min position
    public var min: CGFloat { return fmin(x, y) }
    
    /// Constricts position in rect
    public func clamp(to rect: CGRect) -> CGPoint {
        func _clamp(
            _ value: CGFloat,
            minValue: CGFloat,
            maxValue: CGFloat) -> CGFloat {
            return fmax(minValue, fmin(maxValue, value))
        }
        let px: CGFloat = _clamp(x, minValue: rect.minX, maxValue: rect.maxX)
        let py: CGFloat = _clamp(y, minValue: rect.minY, maxValue: rect.maxY)
        return CGPoint(x: px, y: py)
    }
}

/// Returns vector formed by subtracting point from point
public func - (lhs: CGPoint, rhs: CGPoint) -> CGVector {
    return CGVector(dx: lhs.x - rhs.x, dy: lhs.y - rhs.y)
}

/// Returns vector formed by adding point to point
public func + (lhs: CGPoint, rhs: CGPoint) -> CGVector {
    return CGVector(dx: lhs.x + rhs.x, dy: lhs.y + rhs.y)
}

/// Returns point formed by adding vector to point
public func + (lhs: CGPoint, rhs: CGVector) -> CGPoint {
    return CGPoint(x: lhs.x + rhs.dx, y: lhs.y + rhs.dy)
}

/// Returns point formed by subtracting vector from point
public func - (lhs: CGPoint, rhs: CGVector) -> CGPoint {
    return CGPoint(x: lhs.x - rhs.dx, y: lhs.y - rhs.dy)
}

/// Returns point after applying scaling factor through multiplication
public func * (point: CGPoint, scale: CGFloat) -> CGPoint {
    return CGPoint(x: point.x * scale, y: point.y * scale)
}

/// Returns point after applying scaling factor through division
public func / (point: CGPoint, scale: CGFloat) -> CGPoint {
    return CGPoint(x: point.x / scale, y: point.y / scale)
}

