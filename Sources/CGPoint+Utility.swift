/*
 
 erica sadun, ericasadun.com
 Core Geometry
 
 */

import Foundation
import QuartzCore

// Point
extension CGPoint {    
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
