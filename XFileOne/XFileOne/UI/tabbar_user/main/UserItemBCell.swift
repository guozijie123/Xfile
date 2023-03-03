//
//  UserItemBCell.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/1/29.
//

import UIKit

class UserItemBCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // 点击事件
    
    @IBAction func clickAction(_ sender: UIButton) {
        /*
         每个Button 的 tag 在 xib 已经设置好
         首页从 1000 开始
         商城从 2000 开始
         仓库从 3000 开始
         我的从 4000 开始
         
         UI Cell 是tableView的第四个分区，所以从 4030～4037
         */
        
        switch (sender.tag) {
        case 4030:
            print("点击了 开盒记录")
            Tools.getTopViewController()?.navigationController?.pushViewController(JJRecordViewController(), animated: true)
        case 4031:
            print("点击了 兑换CDKEY")
            let customView = JJExchangePopView.initPopView()
            JJPopView.initMainView(subView: customView)
        case 4032:
            print("点击了 地址管理")
            Tools.getTopViewController()?.navigationController?.pushViewController(JJAddressViewController(), animated: true)
        case 4033:
            print("点击了 商务合作")
            Tools.getTopViewController()?.navigationController?.pushViewController(JJCooperationViewController(nibName: "JJCooperationViewController", bundle: nil), animated: true)
        case 4034:
            print("点击了 联系客服")
            
            Tools.getTopViewController()?.navigationController?.pushViewController(JJWebViewController(urlStr: "https://mohe.goldenb.cc/#/servier", urlTitle: "联系客服"), animated: true)
        
        case 4035:
            print("点击了 设置")
            Tools.getTopViewController()?.navigationController?.pushViewController(JJSettingViewController(), animated: true)
        case 4036:
            print("点击了 开问题反馈")
        case 4037:
            print("点击了 未成年人投诉")
        default:
            break
        }
        
    }
    
}
