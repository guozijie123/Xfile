//
//  JJUser.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/2/19.
//

import UIKit

class JJUser: NSObject {

    static let shared = JJUser()
    
    var userid: String = ""
    var phone: String = ""
    var img: String = ""
    
    func initUser(json: [String:Any]) {
        self.userid = json["userid"] as! String
        self.phone = json["phone"] as! String
        self.img = json["img"] as! String
    }
}
