//
//  JJSignInViewController.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/1/28.
//

import UIKit
import CommonCrypto
import Alamofire
import RxSwift
import RxCocoa

class JJSignInViewController: BaseViewController {

    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var accountLoginButton: UIButton!
    @IBOutlet weak var phoneLoginButton: UIButton!
    var currentButton: UIButton!
    var scrollview: UIScrollView!
    @IBOutlet weak var wrapView: UIView!
    
    let accountTextField = UITextField()
    let pwdTextField = UITextField()
    let phoneTextField = UITextField()
    let codeTextField = UITextField()
    let codeButton = UIButton(type: .custom)
    
    let accountSignin = UIButton(type: .custom)
    let phoneSignin = UIButton(type: .custom)
    
    let disposeBag = DisposeBag()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vhl_navBarBackgroundAlpha = 0
        vhl_navBarBackgroundColor = .clear
        self.navigationController?.navigationBar.backgroundColor = .clear
        initSubViews()
        initObserve()
    }

    func initObserve() {
        let accountValid = accountTextField.rx.text.orEmpty.map { (text) -> Bool in
            return text.count > 4
        }
        let pwdValid = pwdTextField.rx.text.orEmpty.map { (text) -> Bool in
            return text.count >= 6
        }
        
        // 监听按钮状态
        Observable.combineLatest(accountValid,pwdValid) { $0 && $1 }.subscribe(onNext: { [weak self](enable) in
            self?.changeLoginButtonStatus(enable: enable)
        }).disposed(by: disposeBag)
        
        let phoneValid = phoneTextField.rx.text.orEmpty.map { (text) -> Bool in
            return text.count > 4
        }
        let codeValid = codeTextField.rx.text.orEmpty.map { (text) -> Bool in
            return text.count >= 4
        }
        
        // 监听按钮状态
        Observable.combineLatest(phoneValid,codeValid) { $0 && $1 }.subscribe(onNext: { [weak self](enable) in
            self?.changeLoginButtonStatus(enable: enable)
        }).disposed(by: disposeBag)
    }

    override func initSubViews() {
        
        self.view.layoutIfNeeded()
        let bg = UIImageView(image: UIImage(named: "login_bg"))
        bg.frame = CGRect(x: 0, y: -UIDevice.xp_navigationFullHeight(), width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        view.addSubview(bg)
        view.sendSubviewToBack(bg)
        
       

    
        accountLoginButton.setTitleColor(UIColor.kRGB(R: 39, G: 42, B: 51), for: .selected)
        accountLoginButton.setTitleColor(UIColor.kColor(RGB: 175), for: .normal)
        phoneLoginButton.setTitleColor(UIColor.kRGB(R: 39, G: 42, B: 51), for: .selected)
        phoneLoginButton.setTitleColor(UIColor.kColor(RGB: 175), for: .normal)
        currentButton = accountLoginButton
        currentButton.isSelected = true
        
        
        let scrollview = UIScrollView()
        scrollview.frame = CGRect(x: 0, y: wrapView.top, width: UIScreen.main.bounds.size.width, height: Tools.kScaleUI(size: 250))
        scrollview.contentSize = CGSizeMake(UIScreen.main.bounds.size.width * 2, 0)
        scrollview.isPagingEnabled = true
        scrollview.showsHorizontalScrollIndicator = false
        scrollview.isScrollEnabled = false
        view.addSubview(scrollview)
        self.scrollview = scrollview

        wrapView.isHidden = true
        
        let accountView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: scrollview.height))
        accountView.backgroundColor = .clear
        scrollview.addSubview(accountView)
        

        let wrap1 = setWrap(index: 0)
        accountView.addSubview(wrap1)
        
        accountTextField.placeholder = "输入账号"
        accountTextField.font = UIFont.Medium(size: 16)
        accountTextField.textColor = UIColor.kRGB(R: 49, G: 32, B: 51)
        wrap1.addSubview(accountTextField)
        accountTextField.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        let wrap2 = setWrap(index: 1)
        accountView.addSubview(wrap2)
        
        pwdTextField.placeholder = "输入密码"
        pwdTextField.font = UIFont.Medium(size: 16)
        pwdTextField.textColor = UIColor.kRGB(R: 49, G: 32, B: 51)
        wrap2.addSubview(pwdTextField)
        pwdTextField.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        accountSignin.addTarget(self, action: #selector(accountSigninAction), for: .touchUpInside)
        accountSignin.setTitle("登录", for: .normal)
        accountSignin.setTitleColor(UIColor.kRGB(R: 51, G: 32, B: 49), for: .normal)
        accountSignin.setBackgroundImage(UIImage(named:"button_bg_enable"), for: .normal)
        accountSignin.setBackgroundImage(UIImage(named:"button_bg_disable"), for: .disabled)
        accountSignin.isEnabled = false
        accountView.addSubview(accountSignin)
        accountSignin.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.top.equalTo(wrap2.snp.bottom).offset(40)
            make.height.equalTo(Tools.kScaleUI(size: 45))
        }
        
        
        let phoneView = UIView(frame: CGRect(x: UIScreen.main.bounds.size.width, y: 0, width: scrollview.width, height: scrollview.height))
        phoneView.backgroundColor = .clear
        scrollview.addSubview(phoneView)
        
        let wrap3 = setWrap(index: 0)
        phoneView.addSubview(wrap3)
        
        phoneTextField.placeholder = "输入账号"
        phoneTextField.font = UIFont.Medium(size: 16)
        phoneTextField.textColor = UIColor.kRGB(R: 49, G: 32, B: 51)
        phoneTextField.keyboardType = .numberPad
        wrap3.addSubview(phoneTextField)
        phoneTextField.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        let wrap4 = setWrap(index: 1)
        phoneView.addSubview(wrap4)
    
        codeButton.setTitle("获取验证码", for: .normal)
        codeButton.titleLabel?.font = UIFont.Bold(size: 16)
        codeButton.setTitleColor(UIColor.kRGB(R: 0, G: 130, B: 223), for: .normal)
        wrap4.addSubview(codeButton)
        codeButton.snp.makeConstraints { make in
            make.top.bottom.right.equalToSuperview()
        }
        
        codeTextField.placeholder = "输入验证码"
        codeTextField.font = UIFont.Medium(size: 16)
        codeTextField.textColor = UIColor.kRGB(R: 49, G: 32, B: 51)
        codeTextField.keyboardType = .numberPad
        wrap4.addSubview(codeTextField)
        codeTextField.snp.makeConstraints { make in
            make.top.bottom.left.equalToSuperview()
            make.right.equalTo(codeButton.snp.left)
        }
        
        phoneSignin.addTarget(self, action: #selector(phoneSigninAction), for: .touchUpInside)
        phoneSignin.setTitle("登录", for: .normal)
        phoneSignin.setTitleColor(UIColor.kRGB(R: 51, G: 32, B: 49), for: .normal)
        phoneSignin.setBackgroundImage(UIImage(named:"button_bg_enable"), for: .normal)
        phoneSignin.setBackgroundImage(UIImage(named:"button_bg_disable"), for: .disabled)
        phoneSignin.isEnabled = false
        phoneView.addSubview(phoneSignin)
        phoneSignin.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.top.equalTo(wrap4.snp.bottom).offset(40)
            make.height.equalTo(Tools.kScaleUI(size: 45))
        }
        
    }

    
    @IBAction func switchLoginType(_ sender: UIButton) {
        if sender != currentButton {
            currentButton.isSelected = false
            currentButton = sender
            currentButton.isSelected = true
            
            UIView.animate(withDuration: 0.25, delay: 0) {
                self.lineView.centerX = self.currentButton.centerX
            }
            
            self.scrollview.setContentOffset(CGPoint(x: currentButton == accountLoginButton ? 0 : UIScreen.main.bounds.size.width, y: 0), animated: true)

        }
    }
    
    // 改变按钮状态
    func changeLoginButtonStatus(enable: Bool) {
        if currentButton == accountLoginButton {
            // 当前是账号登录
            self.accountSignin.isEnabled = enable
        }else {
            // 当前是手机登录
            self.phoneSignin.isEnabled = enable
        }
    }
    
    @objc func accountSigninAction() {
        let phone = "18824180016"
        let code = "86"
        let password = "112233"
        
        
        
        let aesPwd: String = HandleTheString.handleThePassword(password)
        //此处必须要升序排序
        let handle1: [String: String] = ["ccode":code,"password":aesPwd,"phone":phone]
        let sign = HandleTheString.handleTheSign(handle1)
        
        let postParmas:[String:String] = ["phone":phone,"password":HandleTheString.handleThePassword(password),"ccode":code,"sign":sign!]
        
        //开始数据请求
        print(postParmas)
        
        IndiaServer.getStart().regAndLogin(withThePhone: phone, code: code, password: password, model: (1 != 0)) { [weak self] userId, errMsg in
            if userId != nil {
                JJManager.shared.login(userId: userId!)
                JJToast.toast(content: "登录成功")
                self?.dismiss(animated: true)
            }else {
                JJToast.toast(content: errMsg ?? "")
            }
        }
    }
    
    @objc func phoneSigninAction() {
        
    }
    
    
    //
    func setWrap(index: Int) -> UIView {
        let wrap1 = UIView(frame: CGRect(x: 20, y: CGFloat(index) * Tools.kScaleUI(size: 50), width: UIScreen.main.bounds.size.width - 40, height: Tools.kScaleUI(size: 50)))
        
        let line1 = UIView()
        wrap1.addSubview(line1)
        line1.backgroundColor = UIColor.kColor(RGB: 173)
        line1.frame = CGRect(x: 0, y: wrap1.height - 1, width: wrap1.width, height: 1)
        return wrap1
    }
    
}
