/*
 
 erica sadun, ericasadun.com
 Core Geometry
 
 */

import Foundation
import QuartzCore

// Vending Common angles
extension CGAngle {
    /// Fractional pi: 30°, 45°, 60°, 90°, 120°, 135°, 150°
    public static let (sixthPi, quarterPi, thirdPi, halfPi, twothirdsPi, threeQuartersPi, fiveSixthsPi) =
        (pi / 6, 0.25 * pi, pi / 3, 0.5 * pi, 2 * pi / 3, 3 * pi / 4, 5 * pi / 6)
}

extension CGAngle {
    private func apply(_ f: (Double) -> Double) -> CGFloat { return CGFloat(f(Double(radians))) }
    
    /// Returns sine
    public var sin: CGFloat { return apply(Foundation.sin) }
    
    /// Returns cosine
    public var cos: CGFloat { return apply(Foundation.cos) }
    
    /// Returns tangent
    public var tan: CGFloat { return apply(Foundation.tan) }
    
    /// Returns cosecant
    public var csc: CGFloat { return 1 / sin }
    
    /// Returns secant
    public var sec: CGFloat { return 1 / cos }
    
    /// Returns cotangent
    public var cot: CGFloat { return 1 / tan }
}
