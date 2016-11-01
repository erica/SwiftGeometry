/*
 
 erica sadun, ericasadun.com
 Core Geometry
 
 */

import Foundation
import QuartzCore

// Core Graphics-facing Angles
extension CGAngle {
    /// Quadrant
    ///
    /// - seeAlso: http://mathforum.org/library/drmath/view/65647.html
    public enum Quadrant { case I, II, III, IV, axisIandII, axisIIandIII, axisIIIandIV, axisIVandI, undefined }
    
    /// Returns quadrant
    public var quandrant: Quadrant {
        switch standardized.radians {
        case CGAngle.halfPi: return .axisIandII
        case CGAngle.pi, -CGAngle.pi: return .axisIIandIII
        case -CGAngle.halfPi: return .axisIIIandIV
        case 0: return .axisIVandI
        case 0 ..< CGAngle.halfPi: return .I
        case 0 ..< CGFloat.infinity: return .II
        case -CGFloat.infinity ..< -CGAngle.halfPi: return .III
        case -CGAngle.halfPi ..< 0: return .IV
        default: return .undefined
        }
    }
}
