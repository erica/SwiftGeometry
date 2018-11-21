/*
 
 erica sadun, ericasadun.com
 Core Geometry
 
 */

import Foundation
import QuartzCore

extension CGVector {
    /// Returns point representation
    public func asPoint() -> CGPoint { return CGPoint(x: dx, y: dy) }
    
    /// Returns vector representation
    public func asSize() -> CGSize { return CGSize(width: dx, height: dy) }
    
    /// Returns scale representation
    public func asScale() -> CGScale { return CGScale(sx: dx, sy: dy) }
    
    /// Returns rectangle representation
    public func asRect() -> CGRect { return CGRect(origin: .zero, size: self.asSize()) }
}
