//
//  BaseNavigationController.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2022/8/31.
//

import UIKit

class BaseNavigationController: UINavigationController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
        self.navigationBar.backgroundColor = .white
        
        self.interactivePopGestureRecognizer?.delegate = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if self.viewControllers.count <= 1 {
            return false
        }
        return true
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }else {
            viewController.hidesBottomBarWhenPushed = false
        }
        super.pushViewController(viewController, animated: animated)
    }

}
