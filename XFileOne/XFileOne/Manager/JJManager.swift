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
        let userId = UserDefaults.standard.object(forKey: "kUserId") as? String ?? ""
        if userId.count > 0 {
            self.userId = userId
            getUserInfo(userId: userId)
        }else {
            logout()
        }
    }
    
    // 记录登录
    func login(userId:String) {
        self.userId = userId
        UserDefaults.standard.set(userId, forKey: "kUserId")
        UserDefaults.standard.synchronize()
        getUserInfo(userId: userId)
    }
    // 记录推出登录
    func logout() {
        self.userId = ""
        UserDefaults.standard.removeObject(forKey: "kUserId")
        UserDefaults.standard.synchronize()
    }
}


//MARK: API Function
extension JJManager {

    // 读取最新用户数据
    func getUserInfo(userId: String) {
        IndiaServer.getStart().checkTheUserDetail(userId) { result, error in
            if (result == nil) {
                JJToast.toast(content: error ?? "")
            }else {
                let json = result! as [AnyHashable: Any]
                JJUser.shared.initUser(json: json)
            }
        }
    }
    
    // 读取用户消息
    func getMessage() {
//        IndiaServer.getStart().

    }
    
}
