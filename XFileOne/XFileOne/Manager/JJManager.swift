//
//  JJManager.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/2/19.
//

import Foundation

class JJManager: NSObject {

    static let shared = JJManager()
    
    var userId: String = "" // 保存用户id
    var sign: String = "" // 保存签名
    
    var isLogin: Bool {  // 当userId存在，意味着登录状态
        get {
            return userId.count > 0
        }
    }

}

//MARK: Function
extension JJManager {
    
    // App 启动时调用
    func setup() {
        let sign = UserDefaults.standard.object(forKey: "kSign") as? String ?? ""
        let userId = UserDefaults.standard.object(forKey: "kUserId") as? String ?? ""
        if sign.count > 0 && userId.count > 0 {
            self.userId = userId
            self.sign = sign
            getUserInfo()
        }else {
            logout()
        }
    }
    
    // 记录登录
    func login(userId:String, sign:String) {
        self.userId = userId
        UserDefaults.standard.set(userId, forKey: "kUserId")
        UserDefaults.standard.set(sign, forKey: "kSign")
        UserDefaults.standard.synchronize()
    }
    // 记录推出登录
    func logout() {
        self.userId = ""
        self.sign = ""
        UserDefaults.standard.removeObject(forKey: "kUserId")
        UserDefaults.standard.removeObject(forKey: "kSign")
        UserDefaults.standard.synchronize()
    }
}


//MARK: API Function
extension JJManager {
    // 检查用户是否登录
    func checkOnLine() {
        JJNetworkManager.API_POST(url: "checkonline", postParmas: [:]) { Json in
            print(Json)
        } fail: { msg in
            
        }
    }
    // 读取最新用户数据
    func getUserInfo() {
        let param = ["userid": self.userId, "sign":self.sign]
        JJNetworkManager.API_POST(url: "userinfo", postParmas: param) { Json in
            print(Json)
        } fail: { msg in
            
        }
    }
    
    // 读取用户消息
    func getMessage() {
        let param = ["":""]
        JJNetworkManager.API_POST(url: "getmessage", postParmas: param) { Json in
            print(Json)
        } fail: { msg in
            
        }
    }
}
