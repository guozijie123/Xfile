//
//  JJCouponViewController.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/2/2.
//

import UIKit

class JJCouponViewController: BaseViewController {
    
    var usableButton:UIButton!  // 可用按钮
    var unusableButton:UIButton!  // 不可用按钮
    var switchButton:UIButton!  //
    var animationLine:UIView!
    var scrollView:UIScrollView!
    var VC1: CouponListViewController!
    var VC2: CouponListViewController!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "优惠券"
        initSubViews()
//        api_getList()
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        VC1.view.frame = CGRect(x: 0, y: 0, width: Tools.kScreenWidth(), height: scrollView.height)
        VC2.view.frame = CGRect(x: Tools.kScreenWidth(), y: 0, width: Tools.kScreenWidth(), height: scrollView.height)
    }
    
    override func initSubViews() {
        self.view.backgroundColor = UIColor.kRGB(R: 230, G: 240, B: 247)
        
        let navView = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: 44))
        navView.backgroundColor = .white
       
        let usableButton = UIButton(type: .custom)
        usableButton.setTitle("可用", for: .normal)
        usableButton.titleLabel?.font = UIFont.Medium(size: 15)
        usableButton.setTitleColor(UIColor.kColor(RGB: 56), for: .normal)
        usableButton.frame = CGRect(x: 0, y: 0, width: 60, height: 44)
        usableButton.centerX = view.width/4
        usableButton.addTarget(self, action: #selector(switchType), for: .touchUpInside)
        
        let unusableButton = UIButton(type: .custom)
        unusableButton.setTitle("不可用", for: .normal)
        unusableButton.titleLabel?.font = UIFont.Medium(size: 15)
        unusableButton.setTitleColor(UIColor.kColor(RGB: 56), for: .normal)
        unusableButton.frame = CGRect(x: navView.width - 80, y: 0, width: 60, height: 44)
        unusableButton.centerX = view.width/4*3
        unusableButton.addTarget(self, action: #selector(switchType), for: .touchUpInside)
        
        navView.addSubview(usableButton)
        navView.addSubview(unusableButton)
        
        let animationLine = UIView()
        animationLine.backgroundColor = UIColor.kColor(RGB: 56)
        animationLine.frame = CGRect(x: 0, y: 42, width: 54, height: 2)
        animationLine.centerX = usableButton.centerX
        navView.addSubview(animationLine)
        
        self.animationLine = animationLine
        self.usableButton = usableButton
        self.unusableButton = unusableButton
        self.switchButton = usableButton
        view.addSubview(navView)
        
        
        
        scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: Tools.kScreenWidth() * 2, height: 0)
        scrollView.bounces = false
        scrollView.isPagingEnabled = true
        scrollView.isScrollEnabled = false
        scrollView.showsHorizontalScrollIndicator = false
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(navView.snp.bottom)
            make.bottom.left.right.equalToSuperview()
        }
        
        VC1 = CouponListViewController.initWithType(usable: true)
        self.addChild(VC1)
        scrollView.addSubview(VC1.view)
        
        
        VC2 = CouponListViewController.initWithType(usable: false)
        self.addChild(VC2)
        scrollView.addSubview(VC2.view)
    }
    
    @objc func switchType(btn: UIButton) {
        if switchButton == btn {
            return
        }
        switchButton = btn
        
        
        scrollView.setContentOffset(CGPoint(x: switchButton == usableButton ? 0 : Tools.kScreenWidth() , y: 0), animated: true)
        
        UIView.animate(withDuration: 0.25) {
            self.animationLine.centerX = self.switchButton.centerX
        }
    }
    

}


