//
//  AppDelegate.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2022/8/31.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // 配置全局导航栏属性
        VHLNavigation.hook()
        VHLNavigation.def.navBarShadowImageHidden = true
        
        JJManager.shared.setup()
        
        self.window?.rootViewController = BaseTabBarController()
        self.window?.backgroundColor = UIColor.black
        self.window?.makeKeyAndVisible()
        print("test push")
        
        IndiaServer.getStart().application(application)
        
        return true
    }
    

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        //销毁通知红点
        UIApplication.shared.applicationIconBadgeNumber = 0
        IndiaServer.getStart().applicationDidBecomeActive(application)
    }

}

