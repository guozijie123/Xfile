//
//  ThemeButton.swift
//  Manhattan
//
//  Created by Mario on 2020/12/22.
//

import UIKit

class ThemeButton: UIButton {

    private var gradientLayer = CAGradientLayer()
    // 默认圆角
    var cornerRadius: CGFloat = 6.0 {
        didSet{
            self.layoutSubviews()
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            self.alpha = isEnabled ? 1.0 : 0.5
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        SetupThemeButton()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        SetupThemeButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setThemeGradientLayer()
        self.layerCornerRadius(roundingCorners: UIRectCorner(rawValue: UIRectCorner.allCorners.rawValue), cornerRadii: cornerRadius)
    }
    
    
}

extension ThemeButton {
    
    func SetupThemeButton() {
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.font = UIFont.Medium(size: 14)
        self.layer.insertSublayer(self.gradientLayer, at: 0)
    }
    
    /// 设置渐变色
    func setThemeGradientLayer() {
        gradientLayer.frame = self.bounds
        gradientLayer.borderWidth = 0
        let color1 = UIColor(red: 46.0/255.0, green: 203.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        let color2 = UIColor(red: 31.0/255.0, green: 124.0/255.0, blue: 252.0/255.0, alpha: 1.0)
        
        gradientLayer.colors = [color1.cgColor, color2.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 1)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
    }
}

