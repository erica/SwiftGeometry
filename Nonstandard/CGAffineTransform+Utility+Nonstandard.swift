/*
 
 erica sadun, ericasadun.com
 Core Geometry
 
 */

import Foundation
import QuartzCore

// Anonymous initializers
extension CGAffineTransform {
    public init (_ vector: CGVector) { self.init(vector: vector) }
    public init (_ scale: CGScale) { self.init(scale: scale) }
    public init (_ angle: CGAngle) { self.init(angle: angle) }
}
