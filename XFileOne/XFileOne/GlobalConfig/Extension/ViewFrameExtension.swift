//
//  ViewFrameExtension.swift
//  Manhattan
//
//  Created by Mario on 2020/12/4.
//

import Foundation
import UIKit

extension UIView {
    var x : CGFloat {
        get {
            return frame.origin.x
        }
        set {
            var tempFrame : CGRect = frame
            tempFrame.origin.x     = newValue
            frame                  = tempFrame
        }
    }
    
    var y : CGFloat {
        get {
            return frame.origin.y
        }
        set {
            var tempFrame : CGRect = frame
            tempFrame.origin.y     = newValue
            frame                  = tempFrame
        }
    }
    
    var width : CGFloat {
        get {
            return frame.size.width
        }
        set {
            var tempFrame : CGRect = frame
            tempFrame.size.width   = newValue;
            frame                  = tempFrame
        }
    }

    var height : CGFloat {
        get {
            return frame.size.height
        }
        set {
            var tempFrame : CGRect = frame
            tempFrame.size.height  = newValue;
            frame                  = tempFrame
        }
    }
    
    var centerX : CGFloat {
        get {
            return center.x
        }
        set {
            center = CGPoint(x: newValue, y: center.y)
        }
    }
    
    var centerY :CGFloat {
        get {
            return center.y
        }
        set {
            center = CGPoint(x: center.x, y: newValue)
        }
    }
    
    var middleX : CGFloat {
        get {
            return width / 2
        }
    }
    
    var middleY : CGFloat {
        get {
            return height / 2
        }
    }
    
    var left :CGFloat {
        get {
            return x
        }
        set {
            x = newValue
        }
    }
    
    var right :CGFloat {
        get {
            return x + width
        }
        set {
            x = newValue - width
        }
    }
    
    var top :CGFloat {
        get {
            return y
        }
        set {
            y = newValue
        }
    }
    
    var bottom :CGFloat {
        get {
            return y + height
        }
        set {
            y = newValue - height
        }
    }
    
    
    
}
