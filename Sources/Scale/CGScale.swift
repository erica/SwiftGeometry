/*
 
 erica sadun, ericasadun.com
 Core Geometry
 
 */

import Foundation
import QuartzCore

/// Core Graphics-facing scale, currently missing
/// from the CG structure suite
public struct CGScale {
    
    /// Scale
    public var (sx, sy): (CGFloat, CGFloat)
    
    /// Returns default scale ratios of 1:1
    public init() { self.init(sx: 1, sy: 1) }
    
    /// The CGScale version of .zero
    public var one: CGScale { return CGScale() }

    /// Initialize with caller-supplied values
    public init(sx: CGFloat, sy: CGFloat) {
        (self.sx, self.sy) = (sx, sy)
    }
    
    /// Initialize with a single scale factor
    public init(factor: CGFloat) {
        (self.sx, self.sy) = (factor, factor)
    }
}
