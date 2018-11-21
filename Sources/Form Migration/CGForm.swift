/*
 
 erica sadun, ericasadun.com
 Core Geometry
 
 */

import Foundation
import QuartzCore


extension CGPoint {
    public var vectorForm: CGVector { return CGVector(dx: x, dy: y) }
    public var sizeForm: CGSize { return CGSize(width: x, height: y) }
}

extension CGSize {
    public var vectorForm: CGVector { return CGVector(dx: width, dy: height) }
    public var pointForm: CGPoint { return CGPoint(x: width, y: height) }
}

extension CGVector {
    public var pointForm: CGPoint { return CGPoint(x: dx, y: dy) }
    public var sizeForm: CGSize { return CGSize(width: dx, height: dy) }
}
