/*
 
 erica sadun, ericasadun.com
 Core Geometry
 
 */

import Foundation
import QuartzCore

// Rectangle Positions
extension CGRect {
    /// Returns top left corner
    public var topLeft: CGPoint { return origin }
    
    /// Returns top center point
    public var topCenter: CGPoint { return CGPoint(x: midX, y: minY) }
    
    /// Returns top right corner
    public var topRight: CGPoint { return CGPoint(x: maxX, y: minY) }
    
    /// Returns center left point
    public var centerLeft: CGPoint { return CGPoint(x: minX, y: midY) }
    
    /// Returns center point
    public var center: CGPoint { return CGPoint(x: midX, y: midY) }
    
    /// Returns center right point
    public var centerRight: CGPoint { return CGPoint(x: maxX, y: midY) }
    
    /// Returns bottom left corner
    public var bottomLeft: CGPoint { return CGPoint(x: minX, y: maxY) }
    
    /// Returns bottom center point
    public var bottomCenter: CGPoint { return CGPoint(x: midX, y: maxY) }
    
    /// Returns bottom right corner
    public var bottomRight: CGPoint { return CGPoint(x: maxX, y: maxY) }
}

// Moving Rects
extension CGRect {
    
    /// Returns rect translated to origin
    public var zeroed: CGRect { return CGRect(origin: .zero, size: size) }
    
    /// Constructs a rectangle around a center with the given size
    public static func around(_ center: CGPoint, size: CGSize) -> CGRect {
        let origin = CGPoint(x: center.x - size.width / 2.0, y: center.y - size.height / 2.0)
        return CGRect(origin: origin, size: size)
    }
    
    /// Returns rect centered around point
    func around(_ center: CGPoint) -> CGRect {
        return CGRect.around(center, size: size)
    }
    
    /// Returns rect with coaligned centers
    public func centered(in mainRect: CGRect) -> CGRect {
        return CGRect.around(mainRect.center, size: size)
    }
    
}

// Fitting and Filling
extension CGRect {
    /// Calculates the fitting aspect scale between a source size
    /// and a destination rectangle
    public func fittingAspect(of sourceSize: CGSize) -> CGFloat {
        let scaleW = width / sourceSize.width
        let scaleH = height / sourceSize.height
        return fmin(scaleW, scaleH)
    }
    
    /// Calculates the filling aspect scale between a source size
    /// and a destination rectangle
    public func fillingAspect(of sourceSize: CGSize) -> CGFloat {
        let scaleW = width / sourceSize.width
        let scaleH = height / sourceSize.height
        return fmax(scaleW, scaleH)
    }
    
    /// Fitting into a destination rectangle
    public func fitting(to destination: CGRect) -> CGRect {
        let aspect = destination.fittingAspect(of: size)
        let targetSize = CGSize(width: width * aspect, height: height * aspect)
        return CGRect.around(destination.center, size: targetSize)
    }
    
    /// Filling a destination rectangle
    public func filling(to destination: CGRect) -> CGRect {
        let aspect = destination.fillingAspect(of: size)
        let targetSize = CGSize(width: width * aspect, height: height * aspect)
        return CGRect.around(destination.center, size: targetSize)
    }
}

// Rect math

/// Offset rectangle by vector
public func + (rect: CGRect, vector: CGVector) -> CGRect {
    return rect.offsetBy(dx: vector.dx, dy: vector.dy)
}

/// Offset rectangle by -vector
public func - (rect: CGRect, vector: CGVector) -> CGRect {
    return rect.offsetBy(dx: -vector.dx, dy: -vector.dy)
}

/// Add size to rectangle
public func + (rect: CGRect, size: CGSize) -> CGRect {
    return CGRect(origin: rect.origin, size: rect.size + size)
}

/// Scale rectangle size by scale factor
public func * (rect: CGRect, factor: CGFloat) -> CGRect {
    return CGRect(origin: rect.origin, size: (rect.size * factor))
}

/// Scale rectangle size by scale
public func * (rect: CGRect, scale: CGScale) -> CGRect {
    return CGRect(origin: rect.origin, size: (rect.size * scale))
}

// Rectangle Properties

extension CGRect {
    /// Return rectangle's area
    public var area: CGFloat { return width * height }
    
    /// Return rectangle's diagonal extent
    public var diagonalExtent: CGFloat { return hypot(width, height) }
}


