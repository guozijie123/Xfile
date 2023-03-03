//
//  UIButtonExtension.swift
//  Manhattan
//
//  Created by huaxiang Liang on 2020/12/10.
//

import Foundation
import UIKit

enum RGButtonImagePosition {
        case top          //图片在上，文字在下，垂直居中对齐
        case bottom       //图片在下，文字在上，垂直居中对齐
        case left         //图片在左，文字在右，水平居中对齐
        case right        //图片在右，文字在左，水平居中对齐
}

//MARK: 设置按钮的 文本与图片 的位置
extension UIButton {
    func imagePosition(style: RGButtonImagePosition, spacing: CGFloat) {
            //得到imageView和titleLabel的宽高
            let imageWidth = self.imageView?.frame.size.width
            let imageHeight = self.imageView?.frame.size.height
            
            var labelWidth: CGFloat! = 0.0
            var labelHeight: CGFloat! = 0.0
            
            labelWidth = self.titleLabel?.intrinsicContentSize.width
            labelHeight = self.titleLabel?.intrinsicContentSize.height
            
            //初始化imageEdgeInsets和labelEdgeInsets
            var imageEdgeInsets = UIEdgeInsets.zero
            var labelEdgeInsets = UIEdgeInsets.zero
            
            //根据style和space得到imageEdgeInsets和labelEdgeInsets的值
            switch style {
            case .top:
                //上 左 下 右
                imageEdgeInsets = UIEdgeInsets(top: -labelHeight-spacing/2, left: 0, bottom: 0, right: -labelWidth)
                labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth!, bottom: -imageHeight!-spacing/2, right: 0)
                break
                
            case .left:
                imageEdgeInsets = UIEdgeInsets(top: 0, left: -spacing/2, bottom: 0, right: spacing)
                labelEdgeInsets = UIEdgeInsets(top: 0, left: spacing/2, bottom: 0, right: -spacing/2)
                break
                
            case .bottom:
                imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -labelHeight!-spacing/2, right: -labelWidth)
                labelEdgeInsets = UIEdgeInsets(top: -imageHeight!-spacing/2, left: -imageWidth!, bottom: 0, right: 0)
                break
                
            case .right:
                imageEdgeInsets = UIEdgeInsets(top: 0, left: labelWidth+spacing/2, bottom: 0, right: -labelWidth-spacing/2)
                labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth!-spacing/2, bottom: 0, right: imageWidth!+spacing/2)
                break
                
            }
            self.titleEdgeInsets = labelEdgeInsets
            self.imageEdgeInsets = imageEdgeInsets
            
        }
}

//MARK: 设置按钮 事件闭包
extension UIButton {
    // 定义关联Key
    private struct UIButtonKeys {
        static var clickKey = "UIButton+Extension+ActionKey"
    }
    
    func addActionWithBlock(_ closure: @escaping (_ sender: UIButton) ->()) {
        // 把闭包作为一个值先保存起来
        objc_setAssociatedObject(self, &UIButtonKeys.clickKey, closure, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY)
        // 给按钮调价传统的点击事件， 调用写好的方法
        self.addTarget(self, action: #selector(actionForTapGesture), for: .touchUpInside)
    }
    
    @objc func actionForTapGesture() {
        // 取回闭包的值
        let obj = objc_getAssociatedObject(self, &UIButtonKeys.clickKey)
        if let action = obj as? (_ sender: UIButton) ->() {
            action(self)
        }
    }
}

