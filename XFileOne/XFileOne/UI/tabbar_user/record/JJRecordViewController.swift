//
//  JJRecordViewController.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/1/30.
//  开盒记录

import UIKit

class JJRecordViewController: BaseViewController {

    var placeholderBackground: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "开盒记录"
        // Do any additional setup after loading the view.
        initSubViews()
    }
    
    override func initSubViews() {
        placeholderBackground = UIImageView(image: UIImage(named: "user_recordBackground"))
        view.addSubview(placeholderBackground)
        placeholderBackground.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        let button = UIButton(type: .custom)
        button.setTitleColor(UIColor.kColor(RGB: 124), for: .normal)
        button.titleLabel?.font = UIFont.Bold(size: 14)
        button.setTitle("前往仓库", for: .normal)
        let customNavigation = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = customNavigation
        
        weak var weakSelf = self
        button.addActionWithBlock { sender in
            weakSelf?.tabBarController?.selectedIndex = 2
            weakSelf?.navigationController?.popViewController(animated: false)
        }
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
