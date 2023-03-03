//
//  UserItemACell.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/1/29.
//

import UIKit

class UserItemACell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func clickItem(_ sender: UIButton) {
        
        switch (sender.tag) {
        case 4020:
            print("优惠券")
            Tools.getTopViewController()?.navigationController?.pushViewController(JJCouponViewController(), animated: true)
        case 4021:
            print("邀请有奖")
            
            Tools.getTopViewController()?.navigationController?.pushViewController(JJWebViewController(urlStr: "https://mohe.goldenb.cc/#/invitationPrize", urlTitle: "邀请有奖"), animated: true)
        case 4022:
            print("企业微信")
            
            Tools.getTopViewController()?.navigationController?.pushViewController(JJWebViewController(urlStr: "https://mohe.goldenb.cc/#/enterpriseWechat", urlTitle: "企业微信"), animated: true)
            
        case 4023:
            print("我的消息")
        default: break
        }
        
    }
    
    
}
