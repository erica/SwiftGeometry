/*
 
 erica sadun, ericasadun.com
 Core Geometry
 
 */

import Foundation
import QuartzCore

/*
 
 I've chosen not to include isEqual(to: angle) or comparisons
 
 */

extension CGAngle {
    // Negation
    func negated() -> CGAngle {
        return CGAngle(radians: -radians)
    }
    
    // Negation
    static prefix func - (angle: CGAngle) -> CGAngle {
        return angle.negated()
    }
}

extension CGAngle {
    /// Sign
    public var sign: CGFloat.Sign { return radians.sign }
    
    /// Returns angle between 0 and 2π
    public var positive: CGAngle {
        var r = radians % CGAngle.tau
        if r < 0 { r = r + CGAngle.tau }
        return CGAngle(radians: r)
    }
    
    /// Returns angle between -π and π
    public var standardized: CGAngle {
        let r = positive.radians
        switch positive.radians {
        case 0 ... CGAngle.pi: return CGAngle(radians: r)
        default: return CGAngle(radians: r - CGAngle.tau)
        }
    }
}
