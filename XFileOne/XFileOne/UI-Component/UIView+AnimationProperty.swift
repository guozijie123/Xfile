//
//  UIView+AnimationProperty.swift
//  Manhattan
//
//  Created by Mario on 2020/12/21.
//

import UIKit

private var scaleKey: UInt8 = 0
private var angleKey: UInt8 = 0

extension UIView {

    /// CGAffineTransformMakeScale
    var scale : CGFloat? {
        get {
            if let tmpValue = objc_getAssociatedObject(self, &scaleKey) as? CGFloat {
                return tmpValue
            }else {
                return 0
            }
        }
        set(newVal) {
            objc_setAssociatedObject(self, &scaleKey, newVal, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            transform = CGAffineTransform(scaleX: newVal!, y: newVal!)
        }
    }

    /// CGAffineTransformMakeRotation
    var  angle : CGFloat? {
        get {
            if let tmpValue = objc_getAssociatedObject(self, &angleKey) as? CGFloat {
                return tmpValue
            }else {
                return 0
            }
        }
        set(newVal) {
            objc_setAssociatedObject(self, &angleKey, newVal, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            transform = CGAffineTransform(rotationAngle: newVal!)
        }
    }
}
