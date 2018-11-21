/*
 
 erica sadun, ericasadun.com
 Core Geometry
 
 */

import Foundation
import QuartzCore

extension CGScale {
    /// Invert the scale
    public func inverted() -> CGScale {
        let inverseX = (sx == 0) ? CGFloat.infinity : (1 / sx)
        let inverseY = (sy == 0) ? CGFloat.infinity : (1 / sy)
        return CGScale(sx: inverseX, sy: inverseY)
    }
    
    /// Returns negative extents
    public func negated() -> CGScale { return CGScale(sx: -sx, sy: -sy) }
    
    /// Negate scale
    public static prefix func - (scale: CGScale) -> CGScale {
        return scale.inverted() // should this be negated?
    }
    
    /// Returns scale scaled by scale factor
    public static func * (scale: CGScale, factor: CGFloat) -> CGScale {
        return CGScale(sx: scale.sx * factor, sy: scale.sy * factor)
    }
    
    /// Returns scaled vector
    public static func * (scale: CGScale, vector: CGVector) -> CGVector {
        return CGVector(dx: vector.dx * scale.sx, dy: vector.dy * scale.sy)
    }
    
    /// Returns scaled size
    public static func * (scale: CGScale, size: CGSize) -> CGSize {
        return CGSize(width: size.width * scale.sx, height: size.height * scale.sy)
    }
    
    /// Returns scaled rect
    public static func * (scale: CGScale, rect: CGRect) -> CGRect {
        return CGRect(origin: rect.origin, size: scale * rect.size)
    }
}

