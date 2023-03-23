//
//  boxRecordCell.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/3/23.
//

import UIKit
import Kingfisher

class boxRecordCell: UITableViewCell {
    
    
    
    @IBOutlet weak var _backgroundView: UIView!  // 背景
    @IBOutlet weak var productIcon: UIImageView!
    @IBOutlet weak var productName: UILabel!  // 名称
    @IBOutlet weak var remark: UILabel! // 规格：默认
    @IBOutlet weak var count: UILabel! // 数量
    @IBOutlet weak var buyin: UILabel! // 4w+人购买
    
    
    var model: JJBoxModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        _backgroundView.layer.cornerRadius = 10

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setBoxModel(box: JJBoxModel) {
        self.model = box
        
        self.productName.text = box.title
        self.productIcon.kf.setImage(with: URL(string: model.img))
        
//        var id = 0
//        var userid = 0
//        var exchange = 0
//        var conopen = 0
//        var otime = 0
//        var amount = ""
//        var boxid = ""
//        var sku = ""
//        var img = ""
//        var title = ""
//        var orderid = ""
//        var introduce = ""
    }
    
}
