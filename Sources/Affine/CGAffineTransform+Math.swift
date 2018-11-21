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
    
    /// Add vector translation to transform
    public static func + (transform: CGAffineTransform, vector: CGVector) -> CGAffineTransform {
        return transform.translatedBy(vector)
    }
    
    /// Subtract vector translation from transform
    public static func - (transform: CGAffineTransform, vector: CGVector) -> CGAffineTransform {
        return transform.translatedBy(-vector)
    }
    
    /// Add angle rotation to transform
    public static func + (transform: CGAffineTransform, angle: CGAngle) -> CGAffineTransform {
        return transform.rotatedBy(radians: angle.radians)
    }

    /// Subtract angle rotation from transform
    public static func - (transform: CGAffineTransform, angle: CGAngle) -> CGAffineTransform {
        return transform.rotatedBy(radians: -angle.radians)
    }
    
    /// Scale transform by factor
    public static func * (transform: CGAffineTransform, factor: CGFloat) -> CGAffineTransform {
        return transform.scaledBy(factor: factor)
    }
    
    /// Scale transform by inverse factor
    public static func / (transform: CGAffineTransform, factor: CGFloat) -> CGAffineTransform {
        return transform.scaledBy(factor: 1 / factor)
    }
    
    /// Scale transform
    public static func * (transform: CGAffineTransform, scale: CGScale) -> CGAffineTransform {
        return transform.scaledBy(scale)
    }
    
    /// Inverse scale transform
    public static func / (transform: CGAffineTransform, scale: CGScale) -> CGAffineTransform {
        return transform.scaledBy(scale.inverted())
    }
    
    // MARK: Apply transforms to concrete elements
    
    /// Apply transform to point
    public static func * (point: CGPoint, transform: CGAffineTransform) -> CGPoint {
        return point.applying(transform)
    }

    /// Apply transform to size
    public static func * (size: CGSize, transform: CGAffineTransform) -> CGSize {
        return size.applying(transform)
    }
    
    /// Apply transform to rect
    public static func * (rect: CGRect, transform: CGAffineTransform) -> CGRect {
        return rect.applying(transform)
    }
}
