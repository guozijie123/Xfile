//
//  JJNetworkManager.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/2/19.
//  再次封装网络

import Foundation

let BASE: String = "https://mohe.goldenb.cc:8084/"

public class JJNetworkManager {
    
    
    
    static func API_POST(url: String, postParmas:[String:Any], success: @escaping ([String: Any]) -> Void, fail: @escaping (String) -> Void) {
        
        HN.POST(url: BASE + url, parameters: postParmas).success { JSON in
            JJToast.hideLoading()
            
            let response = JSON as! [String:Any]
            let status = response["status"] as! Int
            if (status == 1) {
                success(response)
            }else {
                let msg = response["msg"] as! String
                fail(msg)
                JJToast.toast(content: msg)
            }
        }.failed { error in
            
        }
    }
    
    static func API_GET(url: String, postParmas:[String:Any], success: @escaping ([String: Any]) -> Void, fail: @escaping (String) -> Void) {
        
        HN.GET(url: BASE + url, parameters: postParmas).success { JSON in
            JJToast.hideLoading()
            
            let response = JSON as! [String:Any]
            let status = response["status"] as! Int
            let msg = response["msg"] as! String
            if (status == 1) {
                success(response)
            }else {
                fail(msg)
                
                JJToast.toast(content: msg)
            }
        }.failed { error in
            
        }
    }
    
    
}
