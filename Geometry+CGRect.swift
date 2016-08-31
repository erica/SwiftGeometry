/*
 
 erica sadun, ericasadun.com
 Core Core Geometry CGRect Utilities
 
 */

import Foundation
import QuartzCore

// Rectangle Positions
public extension CGRect {
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

// Exposed fields
public extension CGRect {
    /// Returns origin x
    public var x: CGFloat { return origin.x }
    /// Returns origin y
    public var y: CGFloat { return origin.x }
    /// Returns size width
    public var width: CGFloat { return size.width }
    /// Returns size height
    public var height: CGFloat { return size.height }
}

// Percentages
public extension CGRect {
    /// Returns point offset by rectangle percent
    public func point(atPercent percentage: CGFloat) -> CGPoint {
        return CGPoint(
            x: origin.x + percentage * size.width,
            y: origin.y + percentage * size.height)
    }
    
    /// Returns point offset by rectangle percents
    public func point(atPercents percentx: CGFloat, _ percenty: CGFloat) -> CGPoint {
        return CGPoint(
            x: origin.x + percentx * size.width,
            y: origin.y + percenty * size.height)
    }
    
    /// Returns percent-factored size
    public func size(withPercent percentage: CGFloat) -> CGSize {
        return CGSize(
            width: percentage * size.width,
            height: percentage * size.height
        )
    }
    
    /// Returns percents-factored size
    public func rect(withPercents px: CGFloat, _ py: CGFloat, _ pw: CGFloat, ph: CGFloat) -> CGRect {
        return CGRect(
            x: origin.x + px * size.width,
            y: origin.y + py * size.height,
            width: pw * size.width,
            height: ph * size.height)
    }
}

// Initializers
public extension CGRect {
    
    /// Initialize from size
    public init(_ size: CGSize) { self.init(origin: .zero, size: size) }
    
    /// Initialize from origin
    public init(_ origin: CGPoint) { self.init(origin: origin, size: .zero) }
    
    /// Initialize using width and height
    public init(width w: CGFloat, height h: CGFloat) { (self.origin, self.size) = (.zero, CGSize(w, h)) }
    
    /// Initialize using shorthand width and height
    public init(w: CGFloat, h: CGFloat) { (self.origin, self.size) = (.zero, CGSize(w, h)) }
    
    /// Initialize using unlabeled width and height
    public init(_ w: CGFloat, _ h: CGFloat) { (self.origin, self.size) = (.zero, CGSize(w, h)) }
    
    /// Initialize a la CGRectMake
    public init(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) {
        self.init(x: x, y: y, width: width, height: height)
    }
    
    /// Initialize with Swift Double a la CGRectMake
    public init(_ x: Double, _ y: Double, _ width: Double, _ height: Double) {
        self.init(x: x, y: y, width: width, height: height)
    }
    
    /// Initialize with Swift Int a la CGRectMake
    public init(_ x: Int, _ y: Int, _ width: Int, _ height: Int) {
        self.init(x: x, y: y, width: width, height: height)
    }
}

// Moving Rects
public extension CGRect {
    
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
public extension CGRect {
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

/// Offset rectangle by point
public func + (lhs: CGRect, rhs: CGPoint) -> CGRect {
    return lhs.offsetBy(dx: rhs.x, dy: rhs.y)
}

/// Scale rectangle size by scale factor
public func * (rect: CGRect, scale: CGFloat) -> CGRect {
    return CGRect(origin: rect.origin, size: (rect.size * scale))
}

// Rectangle Properties

public extension CGRect {
    /// Return rectangle's area
    public var area: CGFloat { return width * height }
    
    /// Return rectangle's diagonal extent
    public var diagonalExtent: CGFloat { return hypot(width, height) }
}


