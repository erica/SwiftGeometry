/*
 
 erica sadun, ericasadun.com
 Core Geometry
 
 */

import Foundation
import QuartzCore

/*
 
 In this imagining, you can add and subtract vectors and angles
 but you multiply and divide by scale
 
 I don't allow math with points, sizes, and rects on the rhs
 Instead they apply transforms when they appear on the lhs
 
 */

extension CGAffineTransform {
    // MARK: Apply relative elements to transforms
    
    public static func + (transform: CGAffineTransform, vector: CGVector) -> CGAffineTransform {
        return transform.translatedBy(vector)
    }
    
    public static func - (transform: CGAffineTransform, vector: CGVector) -> CGAffineTransform {
        return transform.translatedBy(-vector)
    }
    
    public static func + (transform: CGAffineTransform, angle: CGAngle) -> CGAffineTransform {
        return transform.rotatedBy(radians: angle.radians)
    }

    public static func - (transform: CGAffineTransform, angle: CGAngle) -> CGAffineTransform {
        return transform.rotatedBy(radians: -angle.radians)
    }
    
    public static func * (transform: CGAffineTransform, factor: CGFloat) -> CGAffineTransform {
        return transform.scaledBy(factor: factor)
    }
    
    public static func / (transform: CGAffineTransform, factor: CGFloat) -> CGAffineTransform {
        return transform.scaledBy(factor: 1 / factor)
    }
    
    public static func * (transform: CGAffineTransform, scale: CGScale) -> CGAffineTransform {
        return transform.scaledBy(scale)
    }
    
    public static func / (transform: CGAffineTransform, scale: CGScale) -> CGAffineTransform {
        return transform.scaledBy(scale.inverted())
    }
    
    // MARK: Apply transforms to concrete elements
    
    public static func * (point: CGPoint, transform: CGAffineTransform) -> CGPoint {
        return point.applying(transform)
    }

    public static func * (size: CGSize, transform: CGAffineTransform) -> CGSize {
        return size.applying(transform)
    }
    
    public static func * (rect: CGRect, transform: CGAffineTransform) -> CGRect {
        return rect.applying(transform)
    }
}
