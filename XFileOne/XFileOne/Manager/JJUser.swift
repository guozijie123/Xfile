//
//  JJUser.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/2/19.
//

import UIKit

class JJUser: NSObject {

    static let shared = JJUser()
    
    var userid = ""
    var phone = ""
    var img = ""
    var address = ""
    var ccode = ""
    var coin = 0
    var name = ""
    
    func initUser(json: [AnyHashable:Any]) {
        self.userid = String(json[AnyHashable("id")] as? Int ?? 0)
        self.phone = json[AnyHashable("phone")] as! String
        self.img = json[AnyHashable("img")] as! String
        self.address = json[AnyHashable("address")] as! String
        self.ccode = json[AnyHashable("ccode")] as! String
        self.name = json[AnyHashable("name")] as! String
        self.coin = json[AnyHashable("coin")] as? Int  ?? 0
    }
}
