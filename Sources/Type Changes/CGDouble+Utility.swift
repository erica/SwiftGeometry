/*
 
 erica sadun, ericasadun.com
 Core Geometry
 
 */

import Foundation
import QuartzCore

// Core Graphics-facing Double utility
extension Double {
    
    /// Returns self as CGFloat
    public var cgFloat: CGFloat { return CGFloat(self) }
    
    /// Rounds to n decimal places, applying
    /// "schoolbook" rounding rules
    public func rounded(places: Int) -> Double {
        let degree = pow(10.0, Double(places))
        return (self * degree).rounded() / degree
    }
}

// Custom CGAngle Utilities for Double
extension Double {
    
    /// Returns CGAngle of `self` degrees, e.g. `60.cgDegrees`
    public var cgDegrees: CGAngle { return CGAngle(degrees: self.cgFloat) }
    
    /// Return an angle of `self` radians, e.g. `Double.pi.cgRadians`
    public var cgRadians: CGAngle { return CGAngle(radians: self.cgFloat) }
    
    /// Return an angle using `self` number of π's.
    /// For example, 90 is 0.5π, and 360 is 2π: `2.cgPiCount`
    public var cgPiCount: CGAngle { return CGAngle(piCount: self.cgFloat) }
}

