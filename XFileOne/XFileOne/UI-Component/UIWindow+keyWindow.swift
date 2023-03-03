//
//  UIWindow+keyWindow.swift
//  Manhattan
//
//  Created by Mario on 2020/12/22.
//

import UIKit

extension UIWindow {
    class func getKeyWindow() -> UIWindow {
        return UIApplication.shared.keyWindow!
    }
}
