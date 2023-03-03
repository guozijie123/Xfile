//
//  JJExchangePopView.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/1/30.
//  兑换CDKEY 弹框

import UIKit

class JJExchangePopView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    static func initPopView() -> JJExchangePopView {
        let popView = JJExchangePopView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width - 32, height: Tools.kScaleUI(size: 200)))
        
        popView.backgroundColor = .white
        popView.layer.cornerRadius = 10
        
        
        let textField = UITextField()
        textField.textAlignment = .center
        textField.placeholder = "请输入CDKEY"
        textField.font = UIFont.Bold(size: 15)
        textField.backgroundColor = UIColor.kColor(RGB: 230)
        textField.layer.cornerRadius = 10
        popView.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(11)
            make.trailing.equalToSuperview().offset(-11)
            make.centerY.equalToSuperview()
            make.height.equalTo(Tools.kScaleUI(size: 37))
            
        }
        
        let title = UILabel()
        title.text = "兑换 CDKEY"
        title.textAlignment = .center
        title.font = UIFont.Bold(size: 16)
        popView.addSubview(title)
        title.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.bottom.equalTo(textField.snp.top)
        }
        
        let button = UIButton(type: .custom)
        button.backgroundColor = .black
        button.setTitle("兑换", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.Bold(size: 17)
        button.layer.cornerRadius = Tools.kScaleUI(size: 20)
        popView.addSubview(button)
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(textField.snp.bottom).offset(20)
            make.size.equalTo(CGSize(width: Tools.kScaleUI(size: 120), height: Tools.kScaleUI(size: 40)))
        }
        return popView
        
    }

}
