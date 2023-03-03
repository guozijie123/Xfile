//
//  BaseViewController.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2022/8/31.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {

    var tap: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.isTranslucent = false
        // Do any additional setup after loading the view.
        
        tap = UITapGestureRecognizer(target: self, action: #selector(tapToCloseKeyboard))
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    func initSubViews() {}
    

    @objc func keyboardWillShow() {
        view.addGestureRecognizer(tap)
    }
    @objc func keyboardWillHide() {
        view.removeGestureRecognizer(tap)
    }
    @objc func tapToCloseKeyboard() {
        view.endEditing(true)
    }
    
    deinit {
        print("Dealloc ↓↓↓\n \(self)\nDealloc ↑↑↑")
        NotificationCenter.default.removeObserver(self)
    }

}
extension BaseViewController {
    
    /// 恢复导航栏原来颜色
    func navigationAppear() {
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationController?.navigationBar.shadowImage = nil
    }
    /// 将导航栏背景颜色 设置成透明颜色。
    func navigationDisappear() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    /// 隐藏导航栏分割线
    func setNavigationLineHidden () {
        if let backgroundView = self.navigationController?.navigationBar.subviews.first {
            if backgroundView.subviews.count >= 2 {
                for subView in backgroundView.subviews {
                    if subView.className == "_UIBarBackgroundShadowView" {
                        subView.isHidden = true
                        subView.removeFromSuperview()
                        break
                    }
                }
            }else {
                let lineView = backgroundView.subviews.first
                lineView?.isHidden = true
                lineView?.removeFromSuperview()
            }
        }
    }
}
extension BaseViewController {
    
    convenience init(title: String) {
        self.init()
        self.title = title
    }
}
