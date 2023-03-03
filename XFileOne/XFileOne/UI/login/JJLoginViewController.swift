//
//  JJLoginViewController.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/1/12.
//

import UIKit

class JJLoginViewController: BaseViewController {

    @IBOutlet weak var dismissButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!    // 手机登录
    @IBOutlet weak var agreeButton: UIButton!    // 同意按钮
    @IBOutlet weak var agreementLabel: UILabel!  // 协议
    @IBOutlet weak var policyLabel: UILabel!     // 政策
    
    var agree: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        view.backgroundColor = .cyan
        self.vhl_navBarHide = true
        
        initSubViews()
        
    }
    
    override func initSubViews() {
        let bg = UIImageView(image: UIImage(named: "login_bg"))
        bg.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        view.addSubview(bg)
        view.sendSubviewToBack(bg)
        
        agreeButton.setImage(UIImage(named: "user_unsubscribe_nor"), for: .normal)
        agreeButton.setImage(UIImage(named: "user_unsubscribe_sel"), for: .selected)
        
        
        loginButton.setBackgroundImage(UIImage(named: "button_bg_enable"), for: .normal)
        loginButton.setBackgroundImage(UIImage(named: "button_bg_disable"), for: .disabled)
        loginButton.backgroundColor = .clear
        loginButton.setTitleColor(UIColor.kRGB(R: 112, G: 50, B: 6), for: .normal)
        loginButton.setTitleColor(UIColor.kRGB(R: 112, G: 50, B: 6), for: .disabled)
        loginButton.titleLabel?.font = UIFont.Bold(size: 17)
        
        agreeButton.isSelected = false
        loginButton.isEnabled = false
    }

    // 推出页面
    @IBAction func dismissLogin(_ sender: Any) {
        self.dismiss(animated: true)
    }
    @IBAction func loginByPhoneNumber(_ sender: Any) {
        self.navigationController?.pushViewController(JJSignInViewController(nibName: "JJSignInViewController", bundle: nil), animated: true)
    }
    @IBAction func agreeAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        self.loginButton.isEnabled = sender.isSelected
    }
    
    @IBAction func agreeButtonAction(_ sender: Any) {
        agreeAction(self.agreeButton)
    }
    
    @IBAction func quicklyLogin1(_ sender: Any) {
        JJToast.toast(content: "第三方登录1")
    }
    @IBAction func quicklyLogin2(_ sender: Any) {
        JJToast.toast(content: "第三方登录2")
    }
    @IBAction func quicklyLogin3(_ sender: Any) {
        JJToast.toast(content: "第三方登录3")
    }
    
    @IBAction func openAgreement(_ sender: Any) {
        self.navigationController?.pushViewController(JJWebViewController(urlStr: "https://mohe.goldenb.cc/#/serviceAgreement", urlTitle: "用户协议"), animated: true)
    }
    @IBAction func openPolicy(_ sender: Any) {
        self.navigationController?.pushViewController(JJWebViewController(urlStr: "https://mohe.goldenb.cc/#/privacyPolicy", urlTitle: "隐私协议"), animated: true)
    }
}
