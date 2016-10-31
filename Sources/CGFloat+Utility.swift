/*
 
 erica sadun, ericasadun.com
 Core Geometry
 
 */

import Foundation
import QuartzCore

// CGFloat utility extensions
extension CGFloat {
    /// Return π constant
    public static var (pi, π) = (CGFloat(Double.pi), CGFloat(Double.pi))
    
    /// Return CGFloat as Double
    public var double: Double { return Double(self) }
    
    /// Rounded to n decimal places, with "schoolbook" rounding
    public func rounded(places: Int) -> CGFloat {
        let degree = pow(10.0, CGFloat(places))
        return (self * degree).rounded() / degree
    }
}

// Sign
extension CGFloat {
    /// Signs
    public enum Sign { case negative, zero, positive }
    
    /// Returns sign of value
    public var sign: Sign { return self == 0.0 ? .zero : ((self < 0) ? .negative : .positive) }
}

// Modulo
extension CGFloat {
    /// Returns modulo
    static func % (dividend: CGFloat, divisor: CGFloat) -> CGFloat {
        return CGFloat(fmod(Double(dividend), Double(divisor)))
    }
}

// Custom Core Graphics Angle Utilities for CGFloat
extension CGFloat {
    
    /// Return a CGAngle of `self` degrees, e.g. `CGFloat(60).degrees`
    public var degrees: CGAngle { return CGAngle(degrees: self) }
    
    /// Return an angle of `self` radians, e.g. `CGFloat.pi.radians`
    public var radians: CGAngle { return CGAngle(radians: self) }
    
    /// Return an angle using this number of π's.
    /// For example, 180 is 0.5π
    public var piCount: CGAngle { return CGAngle(piCount: self) }
}

