//
//  JJShopViewController.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/1/11.
//

import UIKit

class JJShopViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let  label = UILabel()
        label.text = "待接入H5"
        label.font = UIFont.Bold(size: 25)
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
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
    @objc func testLogin() {
        let login = BaseNavigationController(rootViewController: JJLoginViewController())
        login.modalPresentationStyle = .fullScreen
        self.navigationController?.present(login, animated: true)
    }

}
