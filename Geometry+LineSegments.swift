/*

    erica sadun, ericasadun.com
    line segment geometry

    requires Geometry-Algebra

*/

import Foundation
import QuartzCore


// Line segments

public struct Segment {
    
    public var (p1, p2): (CGPoint, CGPoint)
    
    public init(p1: CGPoint, p2: CGPoint) {
        (self.p1, self.p2) = (p1, p2)
    }
    
    /// Represents the line segment as a vector
    public var vectorForm: CGVector { return p2 - p1 }

    /// Returns the segment slope
    public var slope: CGFloat { return (p2.y - p1.y) / (p2.x - p1.x) }
    
    /// Returns the segment length
    public var length: CGFloat {
        let p = p2 - p1
        return hypot(p.dx, p.dy)
    }
    
    /// Returns a point at % distance along the sector
    public func point(atPercent percent: CGFloat) -> CGPoint {
        return p1 + (p2 - p1) * percent
    }
    
    /// Returns the segment midpoint
    public var midpoint: CGPoint { return point(atPercent: 0.5) }

    /// Returns a point `extent` along the midpoint perpendicular
    public func perpendicular(extent: CGFloat ) -> CGPoint {
        let testPoint = CGPoint(x: p1.y + ((p1.x == p1.y) ? 5.0: 0.0), y: p1.x)
        let point = testPoint.projected(toPerpendicular: self)
        let vector = (point - midpoint).unitForm * extent
        return midpoint + vector
    }
}

// Segment-Point Math

public extension CGPoint {
    /// Returns a point projected to a line segment
    public func projected(toLine segment: Segment) -> CGPoint {
        let lengthSquared = segment.length * segment.length
        let vectorAB = segment.p2 - segment.p1
        let vectorAP = self - segment.p1
        let t = (vectorAP.dx * vectorAB.dx + vectorAP.dy * vectorAB.dy) / lengthSquared
        let projection = segment.p1 + vectorAB * t
        return projection
    }
    
    /// Returns the distance from the point to a line segment
    public func distance(to segment: Segment) -> CGFloat {
        let projectedPoint = projected(toLine: segment)
        return Segment(p1: self, p2: projectedPoint).length
    }
    
    /// Returns the distance from a point to another point
    public func distance(to point: CGPoint) -> CGFloat {
        return Segment(p1: self, p2: point).length
    }
    
    /// Returns a point mirrored across a line segment
    public func mirrored(acrossLine segment: Segment) -> CGPoint {
        let intersection = projected(toLine: segment)
        return intersection + (intersection - self)
    }
    
    /// Returns a point projected to the perpendicular of a line segment
    public func projected(toPerpendicular segment: Segment) -> CGPoint {
        let midpoint = segment.midpoint
        let intersection = projected(toLine: segment)
        let vector = self - intersection
        return midpoint + vector
    }
    
    /// Returns a point mirrored across the perpendicular of a line segment
    public func mirrored(acrossPerpendicular segment: Segment) -> CGPoint {
        let perpPoint = projected(toPerpendicular: segment)
        let midline = Segment(p1: perpPoint, p2: segment.midpoint)
        return mirrored(acrossLine: midline)
    }
}

// Half Plane Tests

public extension Segment {
    
    /// Perform the half plane test on a point
    public func halfPlaneTest(at p: CGPoint) -> CGFloat {
        let (dx, dy) = (p2.x - p1.x, p2.y - p1.y)
        let (tx, ty) = (p.x - p1.x, p.y - p1.y)
        return dx * ty - tx * dy
    }
    
    /// Return yes if the segment crosses another segment
    public func crosses(segment: Segment) -> Bool {
        if p1.equalTo(segment.p1) { return true }
        if p1.equalTo(segment.p2) { return true }
        if p2.equalTo(segment.p1) { return true }
        if p2.equalTo(segment.p2) { return true }
        
        let hp1 = halfPlaneTest(at: segment.p1) < 0.0
        let hp2 = halfPlaneTest(at: segment.p2) < 0.0
        
        let hp3 = segment.halfPlaneTest(at: p1) < 0.0
        let hp4 = segment.halfPlaneTest(at: p2) < 0.0
        
        if hp1 == hp2 { return false }
        if hp3 == hp4 { return false }
        return true
    }
    
    /// Returns the point at which a segment crosses another segment
    public func intersection(withLine segment: Segment) -> CGPoint? {
        if !crosses(segment: segment) { return nil }
        let tx = (p1.x * p2.y - p1.y * p2.x) * (segment.p1.x - segment.p2.x) -
            (segment.p1.x * segment.p2.y - segment.p1.y * segment.p2.x) * (p1.x - p2.x)
        let ty = (p1.x * p2.y - p1.y * p2.x) * (segment.p1.y - segment.p2.y) -
            (segment.p1.x * segment.p2.y - segment.p1.y * segment.p2.x) * (p1.y - p2.y)
        let d = (p1.x - p2.x) * (segment.p1.y - segment.p2.y) -
            (p1.y - p2.y) * (segment.p1.x - segment.p2.x)
        return CGPoint(x: tx / d, y: ty / d)
    }
}

// Circle From Segment

public extension Segment {
    /// Return a circle's center that passes through both segment endpoints
    public func centerWithRadius(radius: CGFloat, clockwise: Bool) -> CGPoint? {
        let pa = clockwise ? p1: p2
        let pb = clockwise ? p2: p1
        let segment = Segment(p1: pa, p2: pb)
        
        let diameter = radius * 2.0
        if segment.length > diameter { return nil }
        
        let midpoint = segment.midpoint
        let x = midpoint.x + sqrt(pow(radius, 2) - pow(segment.length / 2.0, 2)) * (pa.y - pb.y) / segment.length
        let y = midpoint.y + sqrt(pow(radius, 2) - pow(segment.length / 2.0, 2)) * (pb.x - pa.x) / segment.length
        return CGPoint(x: x, y: y)
    }
}
