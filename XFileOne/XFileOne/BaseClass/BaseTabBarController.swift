//
//  BaseTabBarController.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2022/8/31.
//

import UIKit

class BaseTabBarController: UITabBarController, UITabBarControllerDelegate {

    deinit {
        print("BaseTabBarController 销毁")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.isTranslucent = false
        self.delegate = self
        
        initTabBar()
    }
    
    func initTabBar() {
        let home = BaseNavigationController(rootViewController: JJHomeViewController())
        home.tabBarItem.title = "首页".localized
        home.tabBarItem.image = UIImage(named: "tabbar_home_sel")
        home.tabBarItem.selectedImage = UIImage(named: "tabbar_home_nor")
        home.tabBarItem.tag = 0
        
        let shop = BaseNavigationController(rootViewController: JJShopViewController())
        shop.tabBarItem.title = "商城".localized
        shop.tabBarItem.image = UIImage(named: "tabbar_shop_sel")
        shop.tabBarItem.selectedImage = UIImage(named: "tabbar_shop_nor")
        shop.tabBarItem.tag = 1
        
        let warehouse = BaseNavigationController(rootViewController: JJWarehouseViewController())
        warehouse.tabBarItem.title = "仓库".localized
        warehouse.tabBarItem.image = UIImage(named: "tabbar_warehouse_sel")
        warehouse.tabBarItem.selectedImage = UIImage(named: "tabbar_warehouse_nor")
        warehouse.tabBarItem.tag = 2
        
        let user = BaseNavigationController(rootViewController: JJUserViewController())
        user.tabBarItem.title = "我的".localized
        user.tabBarItem.image = UIImage(named: "tabbar_user_sel")
        user.tabBarItem.selectedImage = UIImage(named: "tabbar_user_nor")
        user.tabBarItem.tag = 3
        
        let test = BaseNavigationController(rootViewController: JJTestingViewController())
        test.tabBarItem.title = "测试".localized
        test.tabBarItem.image = UIImage(named: "tabbar_shop_sel")
        test.tabBarItem.selectedImage = UIImage(named: "tabbar_shop_sel")
        test.tabBarItem.tag = 4
        
        viewControllers = [home,shop,warehouse,user,test]
        
        setTabBarItemAttributes()
        
    }
    /// 这种方式比较灵活
   
    func setTabBarItemAttributes(fontName: String = "Courier",
                                fontSize: CGFloat = 14,
                                normalColor: UIColor = .gray,
                                selectedColor: UIColor = .red,
                                bgColor: UIColor = .white) {
           // tabBarItem 文字大小
           var attributes: [NSAttributedString.Key: Any] = [.font: UIFont(name: fontName, size: fontSize)!]
           
           // tabBarItem 文字默认颜色
           attributes[.foregroundColor] = normalColor
           UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .normal)
           
           // tabBarItem 文字选中颜色
           attributes[.foregroundColor] = selectedColor
           UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .selected)
           
           // tabBar 文字、图片 统一选中高亮色
           tabBar.tintColor = selectedColor
           
           // tabBar 背景色
           tabBar.barTintColor = bgColor
       }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag > 0 && JJManager.shared.isLogin == false {
            let login = BaseNavigationController(rootViewController: JJLoginViewController())
            login.modalPresentationStyle = .fullScreen
            Tools.getTopViewController()?.navigationController?.present(login, animated: true)
            
        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return JJManager.shared.isLogin == true
    }
    

}
