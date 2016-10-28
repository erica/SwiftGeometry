/*
 
 erica sadun, ericasadun.com
 Core Geometry
 
 */

import Foundation
import QuartzCore

import Foundation

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
}

