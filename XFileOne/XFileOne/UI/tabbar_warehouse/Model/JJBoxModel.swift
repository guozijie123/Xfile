//
//  JJBoxModel.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/3/21.
//

import UIKit

class JJBoxModel: NSObject {
    var id = 0
    var userid = 0
    var exchange = 0
    var conopen = 0
    var otime = 0
    var amount = ""
    var boxid = ""
    var sku = ""
    var img = ""
    var title = ""
    var orderid = ""
    var introduce = ""
    
    
    static func initWithJson(json:[String:Any]) -> JJBoxModel {
        let obj = JJBoxModel()
        obj.id = json["id"] as! Int
        obj.userid = json["userid"] as! Int
        obj.exchange = json["exchange"] as! Int
        obj.conopen = json["conopen"] as! Int
        obj.otime = json["otime"] as! Int
        obj.boxid = json["boxid"] as? String ?? ""
        obj.sku = json["sku"] as? String ?? ""
        obj.title = json["title"] as? String ?? ""
        obj.orderid = json["orderid"] as? String ?? ""
        obj.img = json["img"] as? String ?? ""
        obj.introduce = json["introduce"] as? String ?? ""
        obj.amount = json["amount"] as? String ?? ""
        
        
        return obj
    }
}
