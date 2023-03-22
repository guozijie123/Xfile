//
//  JJPayProductInfoCell.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/3/20.
//

import UIKit
import Kingfisher

class JJPayProductInfoCell: UITableViewCell {

    @IBOutlet weak var adImageView: UIImageView! // 广告Image
    @IBOutlet weak var productIcon: UIImageView! // 产品图片
    @IBOutlet weak var productName: UILabel!     // 产品名称
    @IBOutlet weak var productPrice: UILabel!    // 产品价格
    @IBOutlet weak var buy_count: UILabel!       // 购买 数量
    @IBOutlet weak var buy_discounts: UILabel!   // 购买 优惠
    @IBOutlet weak var buy_moreDiscounts: UILabel! // 连续优惠
    @IBOutlet weak var total: UILabel! // 总金额
    
    
    var detailModel: payConfirmModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setPayDetail(model: payConfirmModel) {
        self.detailModel = model
        self.productPrice.text = model.amount
        self.total.text = model.payAmount
        self.productName.text = model.title
        self.productIcon.kf.setImage(with: URL(string: model.img))
        
    }
    
}
