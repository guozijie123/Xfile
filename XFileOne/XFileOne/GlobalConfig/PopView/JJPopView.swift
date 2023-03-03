//
//  JJPopView.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/1/30.
//  弹框控件

import UIKit

typealias confirmBlock = () -> () // 确认Block

class JJPopView: UIView {

    /// 半透明遮罩背景
    fileprivate var blackBackgroundView: UIView!
    /// 自定义弹框
    fileprivate var subView: UIView!
    
    deinit {
        print("销毁：JJPopView")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        blackBackgroundView = UIView()
        blackBackgroundView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        addSubview(blackBackgroundView)
        blackBackgroundView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        let singleTapGR = UITapGestureRecognizer(target: self, action: #selector(tapAnywhere))
        blackBackgroundView.addGestureRecognizer(singleTapGR)

        UIWindow.getKeyWindow().addSubview(self)
        self.isUserInteractionEnabled = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
/// 初始化 弹框， 子视图默认居中
    static func initMainView(subView: UIView!) {
        let popView = JJPopView(frame: UIScreen.main.bounds)
        popView.addSubview(subView)
        popView.subView = subView
        
        subView.center = popView.center
        popView.show()
    }
    
//MARK: 通用弹框
    
    /// 初始化消息通知弹框
    /// - Parameters:
    ///   - title: 弹框标题。
    ///   - content: 弹框内容。
    ///   - buttonTitle: 确认按钮。 不填写默认为：知道了
    ///   - callback: 回调。 默认 nil
    /// - Returns: 消息弹框View
    static func initMessagePopView(title: String!, content: String?, buttonTitle: String? = "知道了", callback: confirmBlock?) {
        let popView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width - 32, height: Tools.kScaleUI(size: 170)))
        popView.backgroundColor = .white
        popView.layer.cornerRadius = 10
                
        
        // 确认按钮
        let button = UIButton(type: .custom)
        button.setTitle(buttonTitle, for: .normal)
        button.titleLabel?.font = UIFont.Bold(size: 17)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.kColor(RGB: 42)
        button.layer.cornerRadius = Tools.kScaleUI(size: 20)
        button.addActionWithBlock { sender in
            if let block = callback {
                block()
            }else {
                let superView = popView.superview as! JJPopView
                superView.hide()
            }
        }
        popView.addSubview(button)
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-Tools.kScaleUI(size: 22))
            make.size.equalTo(CGSize(width: Tools.kScaleUI(size: 120), height: Tools.kScaleUI(size: 40)))
        }
        // 标题、内容 容器View
        let containerView = UIView()
        containerView.backgroundColor = .clear
        popView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.bottom.equalTo(button.snp.top)
        }
        
        // 标题
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.Bold(size: 20)
        titleLabel.textColor = .black
        containerView.addSubview(titleLabel)
        
        if (content == nil) {
            titleLabel.snp.makeConstraints { make in
                make.center.equalToSuperview()
            }
        }else {
            //内容
            let contentLabel = UILabel()
            contentLabel.text = content
            contentLabel.font = UIFont.Medium(size: 15)
            contentLabel.textColor = UIColor.kColor(RGB: 149)
            containerView.addSubview(contentLabel)
            
            contentLabel.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.bottom.equalToSuperview().offset(-Tools.kScaleUI(size: 22))
            }
            
            
            titleLabel.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.bottom.equalTo(contentLabel.snp.top).offset(-Tools.kScaleUI(size: 5))
            }
        }
        
        JJPopView.initMainView(subView: popView)
    }
    
    
    /// 确认弹框
    /// - Parameters:
    ///   - title: 标题
    ///   - content: 内容
    ///   - leftButtonTitle: 左边按钮Title
    ///   - rightButtonTitle: 右边按钮Title
    ///   - leftCallback: 左按钮 回调
    ///   - rightCallback: 右按钮 回调
    static func initConfirmPopView(title: String!, content: String?, leftButtonTitle: String?, rightButtonTitle: String?, leftCallback: confirmBlock?, rightCallback: confirmBlock?) {
        let popView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width - 32, height: Tools.kScaleUI(size: 170)))
        popView.backgroundColor = .white
        popView.layer.cornerRadius = 10
                
        
        // 左边按钮
        let leftButton = UIButton(type: .custom)
        leftButton.setTitle(leftButtonTitle, for: .normal)
        leftButton.titleLabel?.font = UIFont.Bold(size: 17)
        leftButton.setTitleColor(.white, for: .normal)
        leftButton.setTitleColor(UIColor.kColor(RGB: 42), for: .normal)
        leftButton.backgroundColor = UIColor.kColor(RGB: 234)
        leftButton.layer.cornerRadius = Tools.kScaleUI(size: 20)
        leftButton.addActionWithBlock { sender in
            if let block = leftCallback {
                block()
            }
            let superView = popView.superview as! JJPopView
            superView.hide()
        }
        popView.addSubview(leftButton)
        
        let rightButton = UIButton(type: .custom)
        rightButton.setTitle(rightButtonTitle, for: .normal)
        rightButton.titleLabel?.font = UIFont.Bold(size: 17)
        rightButton.setTitleColor(.white, for: .normal)
        rightButton.backgroundColor = UIColor.kColor(RGB: 42)
        rightButton.layer.cornerRadius = Tools.kScaleUI(size: 20)
        rightButton.addActionWithBlock { sender in
            if let block = rightCallback {
                block()
            }
            let superView = popView.superview as! JJPopView
            superView.hide()
        }
        popView.addSubview(rightButton)
        
        leftButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(Tools.kScaleUI(size: 25))
            make.bottom.equalToSuperview().offset(-Tools.kScaleUI(size: 22))
            make.size.equalTo(CGSize(width: Tools.kScaleUI(size: 140), height: Tools.kScaleUI(size: 40)))
        }
        rightButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(Tools.kScaleUI(size: -25))
            make.bottom.equalToSuperview().offset(-Tools.kScaleUI(size: 22))
            make.size.equalTo(CGSize(width: Tools.kScaleUI(size: 140), height: Tools.kScaleUI(size: 40)))
        }
        
        
        
        // 标题、内容 容器View
        let containerView = UIView()
        containerView.backgroundColor = .clear
        popView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.bottom.equalTo(rightButton.snp.top)
        }
        
        // 标题
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.Bold(size: 20)
        titleLabel.textColor = .black
        containerView.addSubview(titleLabel)
        
        if (content == nil) {
            titleLabel.snp.makeConstraints { make in
                make.center.equalToSuperview()
            }
        }else {
            //内容
            let contentLabel = UILabel()
            contentLabel.text = content
            contentLabel.font = UIFont.Medium(size: 15)
            contentLabel.textColor = UIColor.kColor(RGB: 149)
            containerView.addSubview(contentLabel)
            
            contentLabel.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.bottom.equalToSuperview().offset(-Tools.kScaleUI(size: 22))
            }
            
            
            titleLabel.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.bottom.equalTo(contentLabel.snp.top).offset(-Tools.kScaleUI(size: 5))
            }
        }
        
        JJPopView.initMainView(subView: popView)
    }
    
    

//MARK: 动画部分
    
    /// 弹出弹框
    final func show() {
        beginShowAnimation()
    }
    /// 隐藏弹框
    final func hide() {
        beginHideAnimation()
    }
    
    //MARK: overwrite by subViews
    
    /// 开始做 弹出动画
    func beginShowAnimation() {
        beforeAnimationConfig()
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.35, initialSpringVelocity: 0.9, options: .beginFromCurrentState, animations: {
            self.subView.scale = 1
        }) { (success) in
            
        }
        
        UIView.animate(withDuration: 0.3) {
            self.blackBackgroundView.alpha = 1
            self.subView.alpha = 1
        }
    }
    /// 开始做 隐藏动画
    func beginHideAnimation() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .beginFromCurrentState, animations: {
            self.blackBackgroundView.alpha = 0
            self.subView.alpha = 0
        }) { [weak self] (success) in
            self?.removeFromSuperview()
        }
        
    }
    
    /// 做动画前 配置
    func beforeAnimationConfig() {
        blackBackgroundView.alpha = 0
        subView.alpha = 0
        subView.scale = 1.5
    }
    
    
    
    @objc func tapAnywhere() {
//        self.endEditing(true)
        self.hide()
    }
    
}
