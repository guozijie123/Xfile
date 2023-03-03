//
//  UIcolor+extension.swift
//  Manhattan
//
//  Created by Mario on 2020/12/23.
//

import UIKit

extension UIColor {
    
    class func kRGBA(R: CGFloat, G: CGFloat, B: CGFloat, A: CGFloat) -> UIColor {
        return UIColor(red: R/255.0, green: G/255.0, blue: B/255.0, alpha: A)
    }
    class func kRGB(R: CGFloat, G: CGFloat, B: CGFloat) -> UIColor {
        return kRGBA(R: R, G: G, B: B, A: 1.0)
    }
    class func kColor(RGB: CGFloat) -> UIColor {
        return kRGBA(R: RGB, G: RGB, B: RGB, A: 1.0)
    }
}
