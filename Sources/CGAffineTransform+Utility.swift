/*
 
 erica sadun, ericasadun.com
 Core Geometry
 
 */

import Foundation
import QuartzCore

/*
 ┌           ┐
 │ a   b   0 │
 │ c   d   0 │
 │ tx  ty  1 │
 └           ┘
 */

/// Exposing core properties
extension CGAffineTransform {
    /// The transform's translation as an (dx, dy) pair
    public var translation: CGVector {
        return CGVector(dx: tx, dy: ty)
    }
    
    /// The transform's scale as an (sx, sy) pair
    public var scale: CGScale {
        return CGScale(sx: sx, sy: sy)
    }

    /// The transform's scale along the x axis
    public var sx: CGFloat {
        return sqrt(a * a + c * c)
    }
    
    /// The transform's scale along the y axis
    public var sy: CGFloat {
        return sqrt(b * b + d * d)
    }
    
    /// The transform's scale in radians
    public var radians: CGFloat {
        return atan2(b, a)
    }
    
    /// The transform's scale in degrees
    public var degrees: CGFloat {
        return radians * 180 / CGFloat(Double.pi)
    }
    
    /// The transform's scale in pi count
    public var piCount: CGFloat {
        return radians / CGFloat(Double.pi)
    }
    
    /// The transform's scale as angle
    public var angle: CGAngle {
        return CGAngle(radians: radians)
    }
}

/// Vend flips
extension CGAffineTransform {

    /// Vertical flip
    public static var vflip = CGAffineTransform(scaleX: 1, y: -1)

    /// Horizontal flip
    public static var hflip = CGAffineTransform(scaleX: -1, y: 1)
}

// Translation Initializers
extension CGAffineTransform {
    
    /// Returns a transform which translates by `(tx, ty)':
    ///
    /// `t = [ 1 0 0 1 tx ty ]`
    public init(tx: CGFloat, ty: CGFloat) {
        (a, b, c, d, self.tx, self.ty) = (1, 0, 0, 1, tx, ty)
    }
    
    /// Returns a vector-initialized transform which translates by `(dx, dy)':
    ///
    /// `t = [ 1 0 0 1 dx dy ]`
    ///
    /// Vectors provide the most natural expression for translation
    public init(vector: CGVector) {
        (a, b, c, d, self.tx, self.ty) = (1, 0, 0, 1, vector.dx, vector.dy)
    }
}

// Scaling Initializers
extension CGAffineTransform {
    
    /// Returns a transform which scales by `(sx, sy)`:
    ///
    /// `t = [ sx, 0, 0, sy, 0, 0 ]`
    ///
    public init(sx: CGFloat, sy: CGFloat) {
        (a, b, c, d, tx, ty) = (sx, 0, 0, sy, 0, 0)
    }
    
    /// Returns a transform which scales using custom CGScale
    public init(scale: CGScale) {
        (a, b, c, d, tx, ty) = (scale.sx, 0, 0, scale.sy, 0, 0)
    }
    
    /// Returns a transform which scales using single scaling factor
    public init(factor: CGFloat) {
        (a, b, c, d, tx, ty) = (factor, 0, 0, factor, 0, 0)
    }
}

// Rotation Initializers
extension CGAffineTransform {
    /// Returns a transform which rotates by radians
    ///
    /// `t = [ cos(angle) sin(angle) -sin(angle) cos(angle) 0 0 ] `
    ///
    public init(radians θ: CGFloat) {
        let (cosθ, sinθ) = (cos(θ), sin(θ))
        (a, b, c, d, tx, ty) = (cosθ, sinθ, -sinθ, cosθ, 0, 0)
    }
    
    /// Returns a transform which rotates by degrees
    ///
    /// `t = [ cos(angle) sin(angle) -sin(angle) cos(angle) 0 0 ] `
    ///
    public init(degrees: CGFloat) {
        let θ = CGAngle(degrees: degrees).radians
        self.init(radians: θ)
    }
    
    /// Returns a transform which rotates by count * π radians
    /// For example, 45 degrees is 0.25 piCount. 180 is 1. 360 is 2.
    ///
    /// `t = [ cos(angle) sin(angle) -sin(angle) cos(angle) 0 0 ] `
    ///
    public init(piCount: CGFloat) {
        self.init(radians: piCount * CGAngle.pi)
    }
    
    /// Returns a transform initialized with a custom CGAngle type
    public init(angle: CGAngle) {
        self.init(radians: angle.radians)
    }
}

// Translations
extension CGAffineTransform {
    /// Translate self by (tx, ty) and return the results.
    /// This is what `translatedBy(x:, y:)` should be
    public func translatedBy(tx: CGFloat, ty: CGFloat) -> CGAffineTransform {
        return self.translatedBy(x: tx, y: ty)
    }
    
    /// Translate self by a vector and return the results.
    /// The label is omitted as this is the natural translation argument
    public func translatedBy(_ vector: CGVector) -> CGAffineTransform {
        return self.translatedBy(tx: vector.dx, ty: vector.dy)
    }
}

// Scaling
extension CGAffineTransform {
    /// Scaling by (sx, sy), which is what `scaledBy(x:,y:)` should be
    public func scaledBy(sx: CGFloat, sy: CGFloat) -> CGAffineTransform {
        return self.scaledBy(x: sx, y: sy)
    }
    
    /// Scales s by (factor, factor) and returns the results
    public func scaledBy(factor: CGFloat) -> CGAffineTransform {
        return self.scaledBy(sx: factor, sy: factor)
    }
    
    /// Scales s by (sx, sy) and returns the results
    /// The label is omitted as this is the natural scaling argument
    public func scaledBy(_ scale: CGScale) -> CGAffineTransform {
        return self.scaledBy(sx: scale.sx, sy: scale.sy)
    }
}

// Rotation
extension CGAffineTransform {
    /// Rotation by radians, which is what `rotated(by:)` should be
    public func rotatedBy(radians: CGFloat) -> CGAffineTransform {
        return self.rotated(by: radians)
    }
    
    /// Rotation by degrees, using what should be the standard approach
    public func rotatedBy(degrees: CGFloat) -> CGAffineTransform {
        return self.rotated(by: degrees * CGFloat(Double.pi) / 180)
    }
    
    /// Rotation by π count, using what should be the standard approach
    public func rotatedBy(piCount: CGFloat) -> CGAffineTransform {
        return self.rotated(by: piCount * CGFloat(Double.pi))
    }
}

// Equality
//
// It would be easy to extend this to == vector, == scale, and == angle
// but I don't see a compelling use case. I have omitted them at this time
//
extension CGAffineTransform {
    // Basic comparison. This is otherwise available via
    //    `public func __equalTo(_ t2: CGAffineTransform) -> Bool`
    public static func == (lhs: CGAffineTransform, rhs: CGAffineTransform) -> Bool {
        return lhs.a == rhs.a && lhs.b == rhs.b &&
        lhs.c == rhs.c && lhs.d == rhs.d &&
        lhs.tx == rhs.tx && lhs.ty == rhs.ty
    }
}
