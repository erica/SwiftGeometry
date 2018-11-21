/*
 
 erica sadun, ericasadun.com
 Core Geometry
 
 */

import Foundation
import QuartzCore

// Forced transforms
extension CGPoint {
    /// Returns vector representation
    public func asVector() -> CGVector { return CGVector(dx: x, dy: y) }
    
    /// Returns size representation
    public func asSize() -> CGSize { return CGSize(width: x, height: y) }
    
    /// Returns scale representation
    public func asScale() -> CGScale { return CGScale(sx: x, sy: y) }
    
    // Returns rectangle representation
    public func asRect() -> CGRect { return CGRect(origin: self, size: .zero) }
}

