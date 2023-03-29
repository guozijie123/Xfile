//
//  couponModel.swift
//  XFileOne
//
//  Created by Douglas on 2023/3/29.
//

import Foundation

class couponModel:NSObject {
    
    var amount = ""
    var title = ""
    var couponid = ""
    var boxid = ""
    var time = ""
    
    static func initWithJson(json: [AnyHashable:Any]) -> couponModel {
        let obj = couponModel()
        obj.amount = json[AnyHashable("discount")] as? String ?? ""
        obj.title = json[AnyHashable("title")] as? String ?? ""
        obj.couponid = json[AnyHashable("couponid")] as? String ?? ""
        obj.boxid = json[AnyHashable("boxid")] as? String ?? ""
        obj.time = json[AnyHashable("exptime")] as? String ?? ""
       
        return obj
    }
}
