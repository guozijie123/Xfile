//
//  JJPayStyleCell.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/3/20.
//

import UIKit

class JJPayStyleCell: UITableViewCell {

    @IBOutlet weak var payIcon: UIImageView!   // 支付方式切图
    @IBOutlet weak var payName: UILabel!       // 支付方式：支付宝、微信支付、其他支付
    @IBOutlet weak var statusIcon: UIImageView!// 状态 （选中、非选中）
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
