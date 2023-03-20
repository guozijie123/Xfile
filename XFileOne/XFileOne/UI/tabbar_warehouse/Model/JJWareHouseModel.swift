//
//  JJWareHouseModel.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/3/20.
//

import UIKit

class JJWareHouseModel: NSObject {
    
    var id = 0
    var give = 0
    var userid = 0
    var type = 0
    var exchange = 0
    var draw = 0
    var coin = 0
    var crtime = 0
    var boxid = ""
    var sku = ""
    var title = ""
    var orderid = ""
    var img = ""
    
    
    
    static func initWithJson(json:[String:Any]) -> JJWareHouseModel {
        let obj = JJWareHouseModel()
        obj.id = json["id"] as! Int
        obj.give = json["give"] as! Int
        obj.userid = json["userid"] as! Int
        obj.type = json["type"] as! Int
        obj.exchange = json["exchange"] as! Int
        obj.draw = json["draw"] as! Int
        obj.coin = json["coin"] as! Int
        obj.crtime = json["crtime"] as! Int
        obj.boxid = json["boxid"] as? String ?? ""
        obj.sku = json["sku"] as? String ?? ""
        obj.title = json["title"] as? String ?? ""
        obj.orderid = json["orderid"] as? String ?? ""
        obj.img = json["img"] as? String ?? ""
        
        return obj
    }
}


