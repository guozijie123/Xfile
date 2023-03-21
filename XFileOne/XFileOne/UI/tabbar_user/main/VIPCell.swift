//
//  VIPCell.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/1/29.
//

import UIKit

class VIPCell: UITableViewCell {

    @IBOutlet weak var view1: UIView! //Vip 背景
    @IBOutlet weak var coin: UILabel!
    
    @IBOutlet weak var vipButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        // 1. 设置渐变色
        view1.layerGradientWithColors(startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 0, y: 1), color1: UIColor.kRGB(R: 84, G: 83, B: 78), color2: UIColor.kColor(RGB: 34))

    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        super.layoutSubviews()

        // 2. 由于是 xib布局，设置layer 需要重新设置 frame, 否则frame 就是初始化 xib frame 的大小
        if ((self.view1.layer.sublayers?.first?.isKind(of: CAGradientLayer.self)) != nil) {
            self.view1.layer.sublayers?.first?.frame = self.view1.frame
        }
    }
    
    // 开通VIP
    @IBAction func vipChannel(_ sender: Any) {
        JJToast.toast(content: "开通VIP")
    }
}
