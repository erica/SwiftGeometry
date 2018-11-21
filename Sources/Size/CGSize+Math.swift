/*
 
 erica sadun, ericasadun.com
 Core Geometry
 
 */

import Foundation
import QuartzCore

extension CGSize {
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

extension CGSize {
    
    // MARK: Scaling
    
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
    
    // MARK: Addition and Subtraction
    
    /// Adds sizes
    public static func + (size1: CGSize, size2: CGSize) -> CGSize {
        return CGSize(width: size1.width + size2.width, height: size1.height + size2.height)
    }
    
    /// Subtract sizes
    public static func - (size1: CGSize, size2: CGSize) -> CGSize {
        return CGSize(width: size1.width - size2.width, height: size1.height - size2.height)
    }
    
    /// Add scalar to size
    public static func + (size: CGSize, amount: CGFloat) -> CGSize {
        return CGSize(width: size.width + amount, height: size.height + amount)
    }
    
    /// Subtract scalar from size
    public static func - (size: CGSize, amount: CGFloat) -> CGSize {
        return CGSize(width: size.width - amount, height: size.height - amount)
    }
    
    /// Add vector to size
    public static func + (size: CGSize, vector: CGVector) -> CGSize {
        return CGSize(width: size.width + vector.dx, height: size.height + vector.dy)
    }
    
    /// Subtract vector from size
    public static func - (size: CGSize, vector: CGVector) -> CGSize {
        return CGSize(width: size.width - vector.dx, height: size.height - vector.dy)
    }
    
    /// Add size + rectangle (Should this be removed?)
    public static func + (size: CGSize, rect: CGRect) -> CGRect {
        return CGRect(origin: rect.origin, size: size + rect.size)
    }
    
    /// Add size + point = rect
    public static func + (size: CGSize, point: CGPoint) -> CGRect {
        return CGRect(origin: point, size: size)
    }
    
    /// Returns negative extents
    public func negated() -> CGSize { return CGSize(width: -self.width, height: -self.height) }
    
    /// Negate size
    public static prefix func - (size: CGSize) -> CGSize {
        return size.negated()
    }
}

