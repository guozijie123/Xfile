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
    
    // 记录当前选中的优惠券，（默认取优惠幅度最大的，如果列表有数据）
    var selectedCoupon:payCouponModel? {
        willSet {
            if newValue != nil {
                self.payAmount = self.amount - newValue!.discount
                // 防止出现负数
                if self.payAmount < 0 {
                    self.payAmount = 0
                }
            }
        }
        didSet {
            print("改变当前选中的优惠券")
        }
    }
    
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
        
        
        if obj.couponList.isEmpty == false {
            // 如果优惠券列表有数据, 默认获取优惠力度最高的
            var max: Double = 0.0
            for i in 0..<obj.couponList.count {
                let couponObj = obj.couponList[i] as payCouponModel
                if couponObj.discount > max {
                    max = couponObj.discount
                    obj.selectedCoupon = couponObj
                }
            }
            obj.payAmount = obj.amount - obj.selectedCoupon!.discount
            // 防止出现负数
            if obj.payAmount < 0 {
                obj.payAmount = 0
            }
        }else {
            // 优惠券列表没有数据
            obj.payAmount = obj.amount
            obj.selectedCoupon = nil
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
