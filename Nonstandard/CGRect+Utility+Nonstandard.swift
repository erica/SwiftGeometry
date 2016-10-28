/*
 
 erica sadun, ericasadun.com
 Core Geometry
 
 */

import Foundation
import QuartzCore

// Anonymous Initializers
extension CGRect {
    
    /// Initialize from size
    public init(_ size: CGSize) { self.init(origin: .zero, size: size) }
    
    /// Initialize from origin
    public init(_ origin: CGPoint) { self.init(origin: origin, size: .zero) }
    
    /// Initialize from vector
    public init(_ vector: CGVector) { self.init(origin: .zero, size: CGSize(vector.dx, vector.dy)) }
    
    /// Initialize using width and height
    public init(width w: CGFloat, height h: CGFloat) { (self.origin, self.size) = (.zero, CGSize(w, h)) }
    
    /// Initialize using shorthand width and height
    public init(w: CGFloat, h: CGFloat) { (self.origin, self.size) = (.zero, CGSize(w, h)) }
    
    /// Initialize using unlabeled width and height
    public init(_ width: CGFloat, _ height: CGFloat) { (self.origin, self.size) = (.zero, CGSize(width, height)) }
    
    /// Initialize a la CGRectMake
    public init(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) {
        self.init(x: x, y: y, width: width, height: height)
    }
    
    /// Initialize with non-literal Swift Double a la CGRectMake
    public init(_ x: Double, _ y: Double, _ width: Double, _ height: Double) {
        self.init(x: x, y: y, width: width, height: height)
    }
    
    /// Initialize with non-literal Swift Int a la CGRectMake
    public init(_ x: Int, _ y: Int, _ width: Int, _ height: Int) {
        self.init(x: x, y: y, width: width, height: height)
    }
}

// Exposed fields without indirection
extension CGRect {
    /// Returns origin x
    public var x: CGFloat {
        get { return origin.x }
        set { origin.x = newValue }
    }
    
    /// Returns origin y
    public var y: CGFloat {
        get { return origin.y }
        set { origin.y = newValue }
    }
    
    /// Returns size width
    public var width: CGFloat {
        get { return size.width }
        set { size.width = newValue }
    }
    
    /// Returns size height
    public var height: CGFloat {
        get { return size.height }
        set { size.height = newValue }
    }
}


