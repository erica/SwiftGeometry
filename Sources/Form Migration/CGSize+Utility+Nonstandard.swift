/*
 
 erica sadun, ericasadun.com
 Core Geometry
 
 */

import Foundation
import QuartzCore

extension CGSize {
    /// Returns point representation
    public func asPoint() -> CGPoint { return CGPoint(x: width, y: height) }
    
    /// Returns vector representation
    public func asVector() -> CGVector { return CGVector(dx: width, dy: height) }
    
    /// Returns scale representation
    public func asScale() -> CGScale { return CGScale(sx: width, sy: height) }
    
    /// Returns rectangle representation
    public func asRect() -> CGRect { return CGRect(origin: .zero, size: self) }
}
