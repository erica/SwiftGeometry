/*
 
 erica sadun, ericasadun.com
 Core Geometry Math
 
 */

import Foundation
import QuartzCore

// Sizes

public extension CGSize {
    /// Returns point representation
    public var pointForm: CGPoint { return CGPoint(x: width, y: height) }
    
    /// Returns vector representation
    public var vectorForm: CGVector { return CGVector(dx: width, dy: height) }
    
    /// Returns rectangle representation
    public var rect: CGRect { return CGRect(origin: .zero, size: self)  }
    
    /// Returns negative extents
    public var negative: CGSize { return CGSize(width: -width, height: -height) }
    
    /// Shorthand initializer
    public init(w: CGFloat, h: CGFloat) { (self.width, self.height) = (w, h) }
    
    /// Unlabeled initializer
    public init(_ w: CGFloat, _ h: CGFloat) { (self.width, self.height) = (w, h) }
}

// Size
public extension CGSize {

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


/// Scales size by multiplying factor
public func * (size: CGSize, scale: CGFloat) -> CGSize {
    return CGSize(width: size.width * scale, height: size.height * scale)
}

/// Scales size by dividing factor
public func / (size: CGSize, scale: CGFloat) -> CGSize {
    return CGSize(width: size.width / scale, height: size.height / scale)
}

