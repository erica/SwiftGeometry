/*
 
 erica sadun, ericasadun.com
 Core Geometry
 
 */

import Foundation
import QuartzCore

extension CGScale {
    /// Returns size representation
    public func asPoint() -> CGPoint { return CGPoint(x: sx, y: sy) }
    
    /// Returns vector representation
    public func asVector() -> CGVector { return CGVector(dx: sx, dy: sy) }
    
    /// Returns size representation
    public func asSize() -> CGSize { return CGSize(width: sx, height: sy) }
}
