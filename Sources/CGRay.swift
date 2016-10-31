/*
 
 erica sadun, ericasadun.com
 Core Geometry
 
 */

import Foundation
import QuartzCore

public struct CGRay {
    /// Ray's origin
    public var origin: CGPoint
    
    /// Ray's unit direction
    public var direction: CGVector {
        get { return _direction }
        set { _direction = CGRay._normalize(vector: newValue) }
    }
    
    /// Establish new instance with origin and direction
    public init(origin: CGPoint, direction vector: CGVector) {
        self.origin = origin
        self._direction = CGRay._normalize(vector: vector)
    }
    
    /// Private normalized vector
    private var _direction: CGVector

    /// Return normalized vector
    private static func _normalize(vector: CGVector) -> CGVector {
        assert(vector.dx != 0 || vector.dy != 0, "Vector must be normalizable")
        let magnitude = hypot(vector.dx, vector.dy)
        return CGVector(dx: vector.dx / magnitude,
                        dy: vector.dy / magnitude)
    }
}
