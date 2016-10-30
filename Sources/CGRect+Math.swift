/*
 
 erica sadun, ericasadun.com
 Core Geometry
 
 */

import Foundation
import QuartzCore

extension CGRect {
    
    // Rect math. Is there a natural operator for inset?
    // What about scale in place? Around center?
    
    /// Offset rectangle by vector
    public static func + (rect: CGRect, vector: CGVector) -> CGRect {
        return rect.offsetBy(dx: vector.dx, dy: vector.dy)
    }
    
    /// Offset rectangle by -vector
    public static func - (rect: CGRect, vector: CGVector) -> CGRect {
        return rect.offsetBy(dx: -vector.dx, dy: -vector.dy)
    }
    
    /// Add size to rectangle
    public static func + (rect: CGRect, size: CGSize) -> CGRect {
        return CGRect(origin: rect.origin, size: rect.size + size)
    }
    
    /// Scale rectangle size by scale factor
    public static func * (rect: CGRect, factor: CGFloat) -> CGRect {
        return CGRect(origin: rect.origin, size: rect.size * factor)
    }
    
    /// Scale rectangle size by scale
    public static func * (rect: CGRect, scale: CGScale) -> CGRect {
        return CGRect(origin: rect.origin, size: rect.size * scale)
    }
    
}
