/*
 
 erica sadun, ericasadun.com
 Core Geometry
 
 */

import Foundation
import QuartzCore

extension CGPoint {
    // MARK: Negation
    
    /// Returns negative extents
    public func negated() -> CGPoint { return CGPoint(x: -x, y: -y) }
    
    /// Negate point
    public static prefix func - (point: CGPoint) -> CGPoint {
        return point.negated()
    }
    
    // MARK: Rect
    
    /// Point addition
    public static func + (p1: CGPoint, p2: CGPoint) -> CGRect {
        let size = CGSize(width: p2.x - p1.x, height: p2.y - p1.y)
        return CGRect(origin: p1, size: size).standardized
    }
    
    /// Point + size addition
    public static func + (point: CGPoint, size: CGSize) -> CGRect {
        return CGRect(origin: point, size: size).standardized
    }
    
    /// Returns standardized rectangle by subtracting size from point
    public static func - (point: CGPoint, size: CGSize) -> CGRect {
        return CGRect(origin: point, size: size.negated()).standardized
    }
    
    // MARK: Vectors
    
    /// Returns vector formed by subtracting point from point
    public static func - (point1: CGPoint, point2: CGPoint) -> CGVector {
        return CGVector(dx: point1.x - point2.x, dy: point1.y - point2.y)
    }
    
    /// Returns point formed by adding vector to point
    public static func + (point: CGPoint, vector: CGVector) -> CGPoint {
        return CGPoint(x: point.x + vector.dx, y: point.y + vector.dy)
    }
    
    /// Returns point formed by subtracting vector from point
    public static func - (point: CGPoint, vector: CGVector) -> CGPoint {
        return CGPoint(x: point.x - vector.dx, y: point.y - vector.dy)
    }
    
    // MARK: Scaling
    
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
}
