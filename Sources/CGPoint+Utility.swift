/*
 
 erica sadun, ericasadun.com
 Core Geometry
 
 */

import Foundation
import QuartzCore

// Point
extension CGPoint {    
    /// Returns negative extents
    public func negated() -> CGPoint { return CGPoint(x: -x, y: -y) }

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
    /// - parameter rect: the target rectangle
    /// - returns: the point clamped to the target rectangle
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

extension CGPoint {
    /// Returns vector formed by subtracting point from point
    public static func - (point1: CGPoint, point2: CGPoint) -> CGVector {
        return CGVector(dx: point1.x - point2.x, dy: point1.y - point2.y)
    }
    
    /// Returns vector formed by adding point to point
    public static func + (point1: CGPoint, point2: CGPoint) -> CGVector {
        return CGVector(dx: point1.x + point2.x, dy: point1.y + point2.y)
    }
    
    /// Returns point formed by adding vector to point
    public static func + (point: CGPoint, vector: CGVector) -> CGPoint {
        return CGPoint(x: point.x + vector.dx, y: point.y + vector.dy)
    }
    
    /// Returns point formed by subtracting vector from point
    public static func - (point: CGPoint, vector: CGVector) -> CGPoint {
        return CGPoint(x: point.x - vector.dx, y: point.y - vector.dy)
    }
    
    /// Returns point after applying scaling factor through multiplication
    public static func * (point: CGPoint, factor: CGFloat) -> CGPoint {
        return CGPoint(x: point.x * factor, y: point.y * factor)
    }
    
    /// Returns point after applying scaling factor through multiplication
    public static func * (point: CGPoint, scale: CGScale) -> CGPoint {
        return CGPoint(x: point.x * scale.sx, y: point.y * scale.sy)
    }
    
    /// Returns point after applying scaling factor through division
    public static func / (point: CGPoint, factor: CGFloat) -> CGPoint {
        return CGPoint(x: point.x / factor, y: point.y / factor)
    }
    
    /// Returns point after applying scaling factor through division
    public static func / (point: CGPoint, scale: CGScale) -> CGPoint {
        return CGPoint(x: point.x / scale.sx, y: point.y / scale.sy)
    }
    
    /// Returns rectangle by adding size to point
    public static func + (point: CGPoint, size: CGSize) -> CGRect {
        return CGRect(origin: point, size: size)
    }
    
    /// Returns standardized rectangle by subtracting size from point
    public static func - (point: CGPoint, size: CGSize) -> CGRect {
        return CGRect(origin: point, size: size.negated()).standardized
    }
    
    /// Negate point
    public static prefix func - (point: CGPoint) -> CGPoint {
        return point.negated()
    }
}
