//
//  OrderConfirmPayView.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/3/20.
//

import UIKit

class OrderConfirmPayView: UIView {

    
    @IBOutlet weak var statusButton: UIButton!    // 选中状态Button
    @IBOutlet weak var protocolButton: UIButton!  // 协议Button
    @IBOutlet weak var payButton: UIButton!       // 支付button
    
    @IBOutlet weak var total: UILabel!  // 金额
    @IBOutlet weak var count: UILabel!  // 数量
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
