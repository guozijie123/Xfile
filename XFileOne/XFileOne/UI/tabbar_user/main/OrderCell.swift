//
//  OrderCell.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/1/29.
//

import UIKit

class OrderCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    点击事件
    
    // 全部订单
    @IBAction func clickOrder(_ sender: Any) {
        Tools.getTopViewController()?.navigationController?.pushViewController(OrderManagerViewController(), animated: true)
    }
    
}
