//
//  FontFitSizeExtension.swift
//  Manhattan
//
//  Created by Mario on 2020/12/4.
//

import Foundation
import UIKit

// UILabel 、 UIButton 、 UITextField 、 UITextView 的 Xib Font 大小自动适配

private var fitFontSizeKey = 300
private var widthConstraintKey = 301

public extension UILabel {
    @IBInspectable var fitFontSize: CGFloat {
        set {
            font = UIFont(name: font.fontName, size: kScaleH(fitFontSize))
            objc_setAssociatedObject(self, &fitFontSizeKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
        get {
            if let fontsize = objc_getAssociatedObject(self, &fitFontSizeKey) as? CGFloat {
                return fontsize
            }
            return font.pointSize
        }
    }
}

public extension UIButton {
    @IBInspectable var fitFontSize: CGFloat {
        set {
            titleLabel!.font = UIFont(name: titleLabel!.font.fontName, size: kScaleH(fitFontSize))
            objc_setAssociatedObject(self, &fitFontSizeKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
        get {
            if let fontsize = objc_getAssociatedObject(self, &fitFontSizeKey) as? CGFloat {
                return fontsize
            }
            return titleLabel!.font.pointSize
        }
    }
}

public extension UITextView {
    @IBInspectable var fitFontSize: CGFloat {
        set {
            font = UIFont(name: font!.fontName, size: kScaleH(fitFontSize))
            objc_setAssociatedObject(self, &fitFontSizeKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
        get {
            if let fontsize = objc_getAssociatedObject(self, &fitFontSizeKey) as? CGFloat {
                return fontsize
            }
            return font!.pointSize
        }
    }
}

public extension UITextField {
    @IBInspectable var fitFontSize: CGFloat {
        set {
            font = UIFont(name: font!.fontName, size: kScaleH(fitFontSize))
            objc_setAssociatedObject(self, &fitFontSizeKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
        get {
            if let fontsize = objc_getAssociatedObject(self, &fitFontSizeKey) as? CGFloat {
                return fontsize
            }
            return font!.pointSize
        }
    }
}

//MARK: 水平方向 约束自适配
public extension NSLayoutConstraint {
    @IBInspectable var widthConstant: CGFloat {
        set {
            constant = kScaleH(widthConstant)
            objc_setAssociatedObject(self, &widthConstraintKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
        get {
            if let width = objc_getAssociatedObject(self, &widthConstraintKey) as? CGFloat {
                return width
            }
            return constant
        }
    }
}

//MARK: 适配大小。 根据 iPhone 8 尺寸

private func kScaleH(_ v: CGFloat) -> CGFloat {
    var scale = UIScreen.main.bounds.width / 375;
    if scale > 1.3 { scale = 1.3 }
    return scale * v
}


//MARK: 系统字体
// 默认使用平方字体
extension UIFont {
    
    class func Regular(size: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Regular", size: kScaleH(size))!
    }
    class func Medium(size: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Medium", size: kScaleH(size))!
    }
    class func Bold(size: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Semibold", size: kScaleH(size))!
    }
    class func Light(size: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Light", size: kScaleH(size))!
    }
    class func Thin(size: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Thin", size: kScaleH(size))!
    }
    class func Ultralight(size: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Ultralight", size: kScaleH(size))!
    }
    
}

