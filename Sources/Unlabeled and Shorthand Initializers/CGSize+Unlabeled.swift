/*
 
 erica sadun, ericasadun.com
 Core Geometry
 
 */

import Foundation
import QuartzCore

extension CGSize {
    /// Unlabeled initializer
    public init(_ width: CGFloat, _ height: CGFloat) { (self.width, self.height) = (width, height) }
    
    /// Shorthand initializer
    public init(w: CGFloat, h: CGFloat) { (self.width, self.height) = (w, h) }
}

