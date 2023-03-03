//
//  JJToast.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2022/9/1.
//

import Foundation
import UIKit

public typealias callback = () -> Void

class JJToast {
    
    /// 提示（默认2秒隐藏）
    static func toast(content: String) {
        DispatchQueue.main.async {
            UIWindow.getKeyWindow().makeToast(content, duration: 2.0, position: .center)
        }

    }
    /// 显示Loading
    static func showLoading() {
        DispatchQueue.main.async {
            UIWindow.getKeyWindow().makeToastActivity(.center)
        }
        
    }
    /// 隐藏Loading
    static func hideLoading() {
        DispatchQueue.main.async {
            UIWindow.getKeyWindow().hideToastActivity()
        }
    }
    
    /// 系统默认弹框
    static func systemAlert(title:String, message:String,  callback: @escaping () -> Void) {
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "取消", style: .cancel)
        let done =  UIAlertAction(title: "确认", style: .default) { _ in
            callback()
        }
    
        alertView.addAction(cancel)
        alertView.addAction(done)
        Tools.getTopViewController()?.present(alertView, animated: true)
    }
}
