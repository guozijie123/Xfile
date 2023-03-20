//
//  Tools.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2022/8/31.
//

import UIKit

class Tools: NSObject {
    
//    等比缩放
    static func kScaleUI(size: CGFloat) -> CGFloat {
        var scale = UIScreen.main.bounds.width / 375;
        if scale > 1.5 { scale = 1.5 }
        return scale * size
    }
    static func kScreenWidth() -> CGFloat{
        return UIScreen.main.bounds.width
    }

    
//    获取当前TopViewController
    static func getTopViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        
        if let nav = base as? UINavigationController {
            return getTopViewController(base: nav.visibleViewController)

        } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return getTopViewController(base: selected)

        } else if let presented = base?.presentedViewController {
            return getTopViewController(base: presented)
        }
        return base
    }

}

extension NSObject {
    var className: String {
        get {
            let name = type(of: self).description()
            if name.contains(".") {
                return name.components(separatedBy: ".")[1]
            }else {
                return name
            }
        }
    }
    
}
