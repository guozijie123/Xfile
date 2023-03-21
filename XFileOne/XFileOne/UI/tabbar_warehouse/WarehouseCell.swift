//
//  WarehouseCell.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/2/20.
//

import UIKit
import Kingfisher

class WarehouseCell: UITableViewCell {
    
    
    @IBOutlet weak var productIcon: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var label2: UILabel! // 中间文本
    @IBOutlet weak var label3: UILabel! // 底部文本
    @IBOutlet weak var statusLabel: UILabel!  // 已兑换、已赠送
    @IBOutlet weak var buttonStackView: UIStackView! // 按钮StackView
    @IBOutlet weak var pickupButton: UIButton!   // 提货
    @IBOutlet weak var exchangeButton: UIButton!  // 兑换
    @IBOutlet weak var giftButton: UIButton!     // 赠送
    @IBOutlet weak var cancelButton: UIButton!   // 取消赠送
    
    var object: JJWareHouseModel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        giftButton.layer.borderColor = UIColor.kColor(RGB: 165).cgColor
        giftButton.layer.borderWidth = 1
        pickupButton.layer.borderColor = UIColor.kColor(RGB: 165).cgColor
        pickupButton.layer.borderWidth = 1
        exchangeButton.layer.borderColor = UIColor.kColor(RGB: 165).cgColor
        exchangeButton.layer.borderWidth = 1
        cancelButton.layer.borderColor = UIColor.kColor(RGB: 165).cgColor
        cancelButton.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    @IBAction func giftAction(_ sender: Any) {
    }
    
    @IBAction func exchangeAction(_ sender: Any) {
        Tools.getTopViewController()?.navigationController?.pushViewController(WareProductViewController(nibName: "WareProductViewController", bundle: nil), animated: true)
    }
    
    @IBAction func pickupAction(_ sender: Any) {
    }
    @IBAction func cancelAction(_ sender: Any) {
    }
    
    
    func setProductModel(model: JJWareHouseModel) {
        self.object = model
        self.productTitle.text = model.title
        self.productIcon.kf.setImage(with: URL(string: model.img))
        
        switch model.type {
        case 0: // 全部
            self.statusLabel.isHidden = true
            self.cancelButton.isHidden = true
            self.buttonStackView.isHidden = false
            self.label3.isHidden = true
        case 1: // 已兑换
            self.statusLabel.isHidden = false
            self.statusLabel.text = "已兑换"
            self.cancelButton.isHidden = true
            self.buttonStackView.isHidden = true
            self.label3.isHidden = false
            self.label3.text = "实付：xxx"
        case 2: // 已提货
            self.statusLabel.isHidden = true
            self.cancelButton.isHidden = true
            self.buttonStackView.isHidden = true
            self.label3.isHidden = false
            self.label3.text = "提货时间：xxxxxx"
        case 3: // 已赠送
            self.statusLabel.isHidden = false
            self.statusLabel.text = "已赠送"
            self.cancelButton.isHidden = false
            self.buttonStackView.isHidden = true
            self.label3.isHidden = true
            
        default:
            self.statusLabel.isHidden = true
            self.cancelButton.isHidden = true
            self.buttonStackView.isHidden = true
            self.label3.isHidden = true
            
            break
        }
        
        //请求仓库列表
        /*
         用户id
         页数
         数据条数
         类型：0全部 1已兑换 2已提货 3已赠送
         
         返回类型数组 数组结构如下
         
         "id": 8, //id
         "sku": "xxx.prize.com", //sku
         "userid": 12, //用户id
         "orderid": "SP202302240951530010028888", //订单id
         "boxid": "aaaaa", //盒子id
         "crtime": 1677203514, //中奖时间
         "coin": 2000, //可兑换盲盒币
         "title": "稀有电动车7", //名称
         "type": 3, //类型 0全部 1已兑换 2提货 3赠送
         "exchange": 1, //是否可以兑换   0否   1是
         "img": "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.alicdn.com%2Fbao%2Fupl" //图片
         */
    }
    
    func setStatus(status: Int) {
        // 1 是正常， 2 是已兑换 3 是已提货 4 是已赠送
        switch (status) {
        case 1:
            self.label2.text = "可兑换盲盒币：558373个"
            self.label2.textColor = UIColor.kRGB(R: 241, G: 179, B: 70)
            self.label2.font = UIFont.Medium(size: 12)
            self.label3.isHidden = true
            self.statusLabel.isHidden = true
            self.cancelButton.isHidden = true
        case 2:
            self.statusLabel.isHidden = false
            self.statusLabel.text = "已兑换"
            self.label2.text = "规格：默认"
            self.label2.font = UIFont.Medium(size: 10)
            self.label2.textColor = UIColor.kColor(RGB: 170)
            self.label3.isHidden = false
            self.label3.text = "实付：10盲盒币"
            self.cancelButton.isHidden = true
            self.buttonStackView.isHidden = true
        case 3:
            self.statusLabel.isHidden = true
            self.label2.text = "规格：默认"
            self.label2.font = UIFont.Medium(size: 10)
            self.label2.textColor = UIColor.kColor(RGB: 170)
            self.label3.isHidden = false
            self.label3.text = "提货时间：2023-01-01 22:34:12"
            self.cancelButton.isHidden = true
            self.buttonStackView.isHidden = true
        case 4:
            self.statusLabel.isHidden = false
            self.statusLabel.text = "已赠送"
            self.label2.font = UIFont.Medium(size: 12)
            self.label2.text = "可兑换盲盒币：558373个"
            self.label2.textColor = UIColor.kColor(RGB: 170)
            self.label3.isHidden = true
            self.cancelButton.isHidden = false
            self.buttonStackView.isHidden = true
        default: break
            
        }
    }
    
}
