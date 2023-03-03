//
//  JJAboutUsViewController.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/2/1.
//

import UIKit

class JJAboutUsViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func clickUserAgreement(_ sender: Any) {
        print("用户协议")
        self.navigationController?.pushViewController(JJWebViewController(urlStr: "https://mohe.goldenb.cc/#/serviceAgreement", urlTitle: "用户协议"), animated: true)
    }
    
    @IBAction func clickPrivacyAgreement(_ sender: Any) {
        print("隐私协议")
        self.navigationController?.pushViewController(JJWebViewController(urlStr: "https://mohe.goldenb.cc/#/privacyPolicy", urlTitle: "隐私协议"), animated: true)
    }
    
    @IBAction func clickServiceAgreement(_ sender: Any) {
        print("用户服务协议")
    }
    
}
