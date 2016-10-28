/*
 
 erica sadun, ericasadun.com
 Core Geometry Math
 
 */

import Foundation
import QuartzCore

// Sizes

extension CGSize {
    /// Returns negative extents
    public func negated() -> CGSize { return CGSize(width: -self.width, height: -self.height) }
    
    /// Returns integral version of size
    public var integral: CGSize {
        return CGSize(
            width: CoreGraphics.floor(width),
            height: CoreGraphics.floor(height))
    }
    
    /// Returns max extent
    public var max: CGFloat { return fmax(width, height) }
    
    /// Returns min extent
    public var min: CGFloat { return fmin(width, height) }
}


// Math

extension CGSize {
    /// Scales size by multiplying factor
    public static func * (size: CGSize, factor: CGFloat) -> CGSize {
        return CGSize(width: size.width * factor, height: size.height * factor)
    }
    
    /// Scales size by multiplication
    public static func * (size: CGSize, scale: CGScale) -> CGSize {
        return CGSize(width: size.width * scale.sx, height: size.height * scale.sy)
    }
    
    /// Scales size by dividing factor
    public static func / (size: CGSize, factor: CGFloat) -> CGSize {
        return CGSize(width: size.width / factor, height: size.height / factor)
    }
    
    /// Scales size by division
    public static func / (size: CGSize, scale: CGScale) -> CGSize {
        return CGSize(width: size.width / scale.sx, height: size.height / scale.sy)
    }
    
    /// Adds sizes
    public static func + (size1: CGSize, size2: CGSize) -> CGSize {
        return CGSize(width: size1.width + size2.width, height: size1.height + size2.height)
    }
    
    /// Subtract sizes
    public static func - (size1: CGSize, size2: CGSize) -> CGSize {
        return CGSize(width: size1.width - size2.width, height: size1.height - size2.height)
    }
    
    /// Add scalar to size
    public static func + (size: CGSize, factor: CGFloat) -> CGSize {
        return CGSize(width: size.width + factor, height: size.height + factor)
    }
    
    /// Subtract scalar from size
    public static func - (size: CGSize, factor: CGFloat) -> CGSize {
        return CGSize(width: size.width - factor, height: size.height - factor)
    }
    
    /// Add vector to size
    public static func + (size: CGSize, vector: CGVector) -> CGSize {
        return CGSize(width: size.width + vector.dx, height: size.height + vector.dy)
    }
    
    /// Subtract vector from size
    public static func - (size: CGSize, vector: CGVector) -> CGSize {
        return CGSize(width: size.width - vector.dx, height: size.height - vector.dy)
    }
    
    /// Negate size
    public static prefix func - (size: CGSize) -> CGSize {
        return size.negated()
    }
}

