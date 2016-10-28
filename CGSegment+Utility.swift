/*
 
 erica sadun, ericasadun.com
 line segment geometry
 
 */

import Foundation
import QuartzCore

extension CGSegment {
    /// Multiply by factor
    public static func * (segment: CGSegment, factor: CGFloat) -> CGSegment {
        return CGSegment(point: segment.p1, vector: segment.vector * factor)
    }
    
    /// Offset by percent travel
    public func travel(by factor: CGFloat) -> CGPoint {
        return p1 + vector * factor
    }
    
    /// Returns the segment midpoint
    public var midpoint: CGPoint { return self.travel(by: 0.5) }
}

// Segment-Point Math

extension CGSegment {
    /// Returns a point `extent` along the midpoint perpendicular
    public func perpendicular(extent: CGFloat ) -> CGPoint {
        let testPoint = CGPoint(x: p1.y + ((p1.x == p1.y) ? 5.0: 0.0), y: p1.x)
        let point = testPoint.projected(toPerpendicular: self)
        let vector = (point - midpoint).unitForm * extent
        return midpoint + vector
    }
}

extension CGPoint {
    /// Returns a point projected to a line segment
    public func projected(toLine segment: CGSegment) -> CGPoint {
        let lengthSquared = segment.length * segment.length
        let vectorAB = segment.p2 - segment.p1
        let vectorAP = self - segment.p1
        let t = (vectorAP.dx * vectorAB.dx + vectorAP.dy * vectorAB.dy) / lengthSquared
        let projection = segment.p1 + vectorAB * t
        return projection
    }
    
    /// Returns the distance from the point to a line segment
    public func distance(to segment: CGSegment) -> CGFloat {
        let projectedPoint = projected(toLine: segment)
        return CGSegment(p1: self, p2: projectedPoint).length
    }
    
    /// Returns the distance from a point to another point
    public func distance(to point: CGPoint) -> CGFloat {
        return CGSegment(p1: self, p2: point).length
    }
    
    /// Returns a point mirrored across a line segment
    public func mirrored(acrossLine segment: CGSegment) -> CGPoint {
        let intersection = projected(toLine: segment)
        return intersection + (intersection - self)
    }
    
    /// Returns a point projected to the perpendicular of a line segment
    public func projected(toPerpendicular segment: CGSegment) -> CGPoint {
        let midpoint = segment.midpoint
        let intersection = projected(toLine: segment)
        let vector = self - intersection
        return midpoint + vector
    }
    
    /// Returns a point mirrored across the perpendicular of a line segment
    public func mirrored(acrossPerpendicular segment: CGSegment) -> CGPoint {
        let perpPoint = projected(toPerpendicular: segment)
        let midline = CGSegment(p1: perpPoint, p2: segment.midpoint)
        return mirrored(acrossLine: midline)
    }
}

// Half Plane Tests

extension CGSegment {
    
    /// Perform the half plane test on a point
    public func halfPlaneTest(at p: CGPoint) -> CGFloat {
        let (dx, dy) = (p2.x - p1.x, p2.y - p1.y)
        let (tx, ty) = (p.x - p1.x, p.y - p1.y)
        return dx * ty - tx * dy
    }
    
    /// Return yes if the segment crosses another segment
    public func crosses(segment: CGSegment) -> Bool {
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
    public func intersection(withLine segment: CGSegment) -> CGPoint? {
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

extension CGSegment {
    /// Return a circle's center that passes through both segment endpoints
    public func centerWithRadius(radius: CGFloat, clockwise: Bool) -> CGPoint? {
        let pa = clockwise ? p1: p2
        let pb = clockwise ? p2: p1
        let segment = CGSegment(p1: pa, p2: pb)
        
        let diameter = radius * 2.0
        if segment.length > diameter { return nil }
        
        let midpoint = segment.midpoint
        let x = midpoint.x + sqrt(pow(radius, 2) - pow(segment.length / 2.0, 2)) * (pa.y - pb.y) / segment.length
        let y = midpoint.y + sqrt(pow(radius, 2) - pow(segment.length / 2.0, 2)) * (pb.x - pa.x) / segment.length
        return CGPoint(x: x, y: y)
    }
}
