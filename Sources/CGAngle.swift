/*
 
 erica sadun, ericasadun.com
 Core Geometry
 
 */

import Foundation
import QuartzCore

// Core Graphics-facing Angles
public struct CGAngle: CustomStringConvertible {
    
    /// The pi constant
    public static let (pi, π) = (CGFloat(Double.pi), CGFloat(Double.pi))
    
    /// The tau constant
    public static let (tau, τ)  = (2 * pi, 2 * pi)
    
    /// Init
    public init() { _radians = 0 }
    
    /// Initialize with radians
    public init(radians: CGFloat) { _radians = radians }
    
    /// Initialize with degrees
    public init(degrees: CGFloat) { _radians = degrees * CGAngle.pi / 180.0 }
    
    /// Initialize with count of π's
    public init(piCount: CGFloat) { _radians = piCount * CGAngle.pi }
    
    /// Express angle in degrees
    public var degrees: CGFloat { return _radians * 180.0 / CGAngle.pi }
    
    /// Express angles as a count of pi
    public var piCount: CGFloat { return _radians / CGAngle.pi }
    
    /// Express angle in (native) radians
    public var radians: CGFloat { return _radians }
    
    /// String convertible support
    public var description: String {
        return "\(degrees)°, \(piCount)π, \(radians) rads"
    }
    
    /// Internal radian store
    private let _radians: CGFloat
}

