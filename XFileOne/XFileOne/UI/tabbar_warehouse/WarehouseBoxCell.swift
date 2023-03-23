//
//  WarehouseBoxCell.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/3/23.
//

import UIKit

class WarehouseBoxCell: UITableViewCell {

    
    @IBOutlet weak var _backgroundView: UIView!  // 背景
    @IBOutlet weak var productIcon: UIImageView! // 图片
    @IBOutlet weak var productPrice: UILabel!  // 价格
    @IBOutlet weak var productName: UILabel! // title
    @IBOutlet weak var remark: UILabel! // 规格： 默认
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        _backgroundView.layer.cornerRadius = 10
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
