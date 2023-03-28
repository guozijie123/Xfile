//
//  payConfirmModel.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/3/22.
//

import UIKit

class payConfirmModel: NSObject {
    var introduce = "" // 介绍
    var couponList: [payCouponModel] = [] // 优惠券列表
    var boxid = ""
    var img = ""
    var title = ""
    var amount: Double = 0.0
    var payAmount: Double = 0.0 //实际支付金额 (金额  -  优惠券)
    
    static func initWithJson(json: [AnyHashable:Any]) -> payConfirmModel {
        let obj = payConfirmModel()
        obj.introduce = json[AnyHashable("introduce")] as? String ?? ""
        obj.boxid = json[AnyHashable("boxid")] as? String ?? ""
        obj.img = json[AnyHashable("img")] as? String ?? ""
        obj.title = json[AnyHashable("title")] as? String ?? ""
        obj.amount = json[AnyHashable("amount")] as? Double ?? 0.0
        
        let list = json[AnyHashable("couponList")] as? Array ?? []
        for couponJson in list {
            obj.couponList.append(payCouponModel.initWithJson(json: couponJson as! [String : Any]))
        }
        
        if let firstDiscount = obj.couponList.first {
            // 如果优惠券列表有数据
            obj.payAmount = obj.amount - firstDiscount.discount
        }else {
            // 优惠券列表没有数据
            obj.payAmount = obj.amount
        }
        

       
        return obj
    }
    
}


// 订单确认详情下的 优惠券Model
class payCouponModel: NSObject {
    var discount:Double = 0.0
    var couponid = ""
    var title = ""
    var exptime = 0
    
    static func initWithJson(json: [String:Any]) -> payCouponModel {
        let obj = payCouponModel()
        obj.discount = json["discount"] as! Double
        obj.exptime = json["exptime"] as! Int
        obj.couponid = json["couponid"] as! String
        obj.title = json["title"] as! String
        return obj
    }
}
