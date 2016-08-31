/*

ericasadun.com
Affine Transforms

*/

import Foundation
import QuartzCore

/*

⎾            ⏋
⎹  a   b   0 ⎹
⎹  c   d   0 ⎹
⎹  tx  ty  1 ⎹
⎿            ⏌

*/

/// Vends affine transform factory methods
extension CGAffineTransform {
    /// Tweakable constructor
    public static func construct(
        _ xScale: CGFloat = 1.0,
        _ yScale: CGFloat = 1.0,
        _ theta: CGFloat = 0.0,
        _ tx: CGFloat = 0.0,
        _ ty: CGFloat = 0.0) -> CGAffineTransform {
        
        var transform: CGAffineTransform = .identity
        if xScale != 1.0 { transform.a = xScale * cos(theta) }
        if yScale != 1.0 { transform.b = yScale * sin(theta) }
        if theta != 0.0 {
            transform.c = xScale * -sin(theta)
            transform.d = yScale * cos(theta)
        }
        if tx != 0.0 { transform.tx = tx }
        if ty != 1.0 { transform.ty = ty }
        
        return transform
    }
    
    /// Translation by dx, dy
    public static func translate(dx: CGFloat, dy: CGFloat) -> CGAffineTransform {
        return CGAffineTransform(translationX: dx, y: dy)
    }
    
    /// Translation by CGSize
    public static func translate(by offset: CGSize) -> CGAffineTransform {
        return CGAffineTransform(translationX: offset.width, y: offset.height)
    }
    
    /// Translation by CGVector
    public static func translate(through offset: CGVector) -> CGAffineTransform {
        return CGAffineTransform(translationX: offset.dx, y: offset.dy)
    }
    
    /// Scale by sx, sy
    public static func scale(sx: CGFloat, sy: CGFloat) -> CGAffineTransform {
        return CGAffineTransform(scaleX: sx, y: sy)
    }
    
    /// Scale by CGSize
    public static func scale(by size: CGSize) -> CGAffineTransform {
        return CGAffineTransform(scaleX: size.width, y: size.height)
    }
    
    /// Scale by Factor
    public static func scale(factor: CGFloat) -> CGAffineTransform {
        return CGAffineTransform(scaleX: factor, y: factor)
    }
    
    /// Rotate by radians
    public static func rotate(by radians: CGFloat) -> CGAffineTransform {
        return CGAffineTransform(rotationAngle: radians)
    }
    
    /// Rotate by degrees
    public static func rotate(degrees: CGFloat) -> CGAffineTransform {
        return CGAffineTransform(rotationAngle: CGFloat(Double.pi) * (degrees / 180.0))
    }
    
    /// Flip vertically
    public static func vflip(height: CGFloat) -> CGAffineTransform {
        return CGAffineTransform(a: 1.0, b: 0.0, c: 0.0, d: -1.0, tx: 0.0, ty: -height)
    }
    
    /// Flip horizontally
    public static func hflip(width: CGFloat) -> CGAffineTransform {
        return CGAffineTransform(a: -1.0, b: 0.0, c: 0.0, d: 1.0, tx: -width, ty: 0.0)
    }
}

/// Visible properties
extension CGAffineTransform {
    var xScale: CGFloat { return sqrt(a * a + c * c) }
    var yScale: CGFloat { return sqrt(b * b + d * d) }
    var scale: CGSize { return CGSize(width: xScale, height: yScale) }
    var rotation: CGFloat { return atan2(b, a) }
}

/// Modifying existing transform {
extension CGAffineTransform {
    /// Returns existing transform with modified translation
    public func with(offset: CGPoint) -> CGAffineTransform {
        return CGAffineTransform.construct(xScale, yScale, rotation, offset.x, offset.y)
    }

    /// Returns existing transform with modified scale
    public func with(scale size: CGSize) -> CGAffineTransform {
        return CGAffineTransform.construct(scale.width, scale.height, rotation, tx, ty)
    }
    
    /// Returns existing transform with modified rotation
    public func with(rotation: CGFloat) -> CGAffineTransform {
        return CGAffineTransform.construct(xScale, yScale, rotation, tx, ty)
    }

}

/// Representations
extension CGAffineTransform: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {
        return
            "[Translation: (\(tx), \(ty)), " +
            "Scale: (\(xScale), \(yScale)), " +
            "Rotation: \(rotation) rad]" }
    
    public var debugDescription: String {
        let degrees = rotation * CGFloat(Double.pi) / 180.0
        return
            "[Translation: (\(tx), \(ty)), " +
                "Scale: (\(xScale), \(yScale)), " +
                "Rotation: (\(rotation) rad, \(degrees)°)]" }
}

