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
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.statusButton.setImage(UIImage(named: "pay_selected"), for: .selected)
        self.statusButton.setImage(UIImage(named: "pay_unselected"), for: .normal)
        
        self.statusButton.isSelected = false
        self.payButton.isEnabled = false
        self.payButton.backgroundColor = UIColor.kColor(RGB: 170)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
   
    }

    
    
    @IBAction func changeStatus(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        self.payButton.backgroundColor = sender.isSelected ? UIColor.systemBlue : UIColor.kColor(RGB: 170)
        self.payButton.isEnabled = sender.isSelected
    }
    
    @IBAction func openProtocol(_ sender: Any) {
        JJToast.toast(content: "打开H5")
    }
    
    
    @IBAction func pay(_ sender: Any) {
        JJToast.toast(content: "发起支付")
    }
    
}
