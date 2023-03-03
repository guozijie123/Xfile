//
//  ViewLayerExtension.swift
//  Manhattan
//
//  Created by Mario on 2020/12/10.
//

import UIKit



extension UIView {

    
    /// 设置渐变色
    func layerGradient() {
        let layer = CAGradientLayer()
        self.layoutIfNeeded()
        layer.frame = self.bounds
        layer.borderWidth = 0
        let color1 = UIColor.kRGB(R: 36, G: 204, B: 255)
        let color2 = UIColor.kRGB(R: 31, G: 128, B: 255)
        
        layer.colors = [color1.cgColor, color2.cgColor]
        layer.startPoint = CGPoint(x: 0, y: 1)
        layer.endPoint = CGPoint(x: 1, y: 1)
        self.layer.insertSublayer(layer, at: 0)
    }
    
    /// 渐变色 （从左到右）
    /// - Parameters:
    ///   - color1: 颜色1
    ///   - color2: 颜色2
    func layerGradientWithColors(color1: UIColor, color2: UIColor) {
        let layer = CAGradientLayer()
        self.layoutIfNeeded()
        layer.frame = self.bounds
        layer.borderWidth = 0
        layer.colors = [color1.cgColor, color2.cgColor]
        layer.startPoint = CGPoint(x: 0, y: 1)
        layer.endPoint = CGPoint(x: 1, y: 1)
        self.layer.insertSublayer(layer, at: 0)
    }
    
    
    /// 渐变色
    /// - Parameters:
    ///   - startPoint: 起始点
    ///   - endPoint: 结束点
    ///   - color1: 颜色1
    ///   - color2: 颜色2
    func layerGradientWithColors(startPoint:CGPoint, endPoint: CGPoint, color1: UIColor, color2: UIColor) {
        let layer = CAGradientLayer()
        layer.frame = self.bounds
        layer.borderWidth = 0
        layer.colors = [color1.cgColor, color2.cgColor]
        layer.startPoint = startPoint
        layer.endPoint = endPoint
        self.layer.insertSublayer(layer, at: 0)
    }
    
    
    
    /// Layer层 圆角
    func layerCornerRadius(roundingCorners: UIRectCorner, cornerRadii: CGFloat) {
        self.layoutIfNeeded()
        let maskPath = UIBezierPath.init(roundedRect: self.bounds, byRoundingCorners: roundingCorners, cornerRadii: CGSize(width: cornerRadii, height: cornerRadii))
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
    }
    
    /// 设置 圆角边框
    func layerBorder(width: CGFloat, color: UIColor, cornerRadii: CGFloat) {
        self.layoutIfNeeded()
        layer.cornerRadius = cornerRadii
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
}
