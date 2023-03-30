//
//  CouponCell.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/2/2.
//

import UIKit

class CouponCell: UITableViewCell {

    @IBOutlet weak var leftBackground: UIImageView! // 可用、不可用背景
    @IBOutlet weak var moneyLabel: UILabel!  // 金额： 10元
    @IBOutlet weak var limitLabel: UILabel!  // 条件： 无门槛
    @IBOutlet weak var couponTitle: UILabel! // 标题： 无门槛10元优惠券
    @IBOutlet weak var couponDescribe: UILabel! // 描述： 适用于所有盲盒
    @IBOutlet weak var couponDate: UILabel!     // 日期： 有效期至 2023.1.1 - 2023.12.1
    @IBOutlet weak var userbutton: UIButton!    // 立即使用
    
    var couponModel: payCouponModel! {
        willSet {
            DispatchQueue.main.async {
                self.moneyLabel.text = String(newValue.discount)
                self.limitLabel.text = "无字段"
                self.couponTitle.text = newValue.title
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func clickUserCoupon(_ sender: Any) {
    }
}
