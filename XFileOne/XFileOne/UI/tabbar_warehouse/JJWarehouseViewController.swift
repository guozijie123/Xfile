//
//  JJWarehouseViewController.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/1/11.
//

import UIKit

class JJWarehouseViewController: BaseViewController {

    
    var shopButton:UIButton!  // 商品
    var boxButton:UIButton!  // 盒子
    var switchButton:UIButton!  // 识别： 商品、盒子
    var animationLine:UIView!
    var scrollView:UIScrollView!
    var shopListVC: ShopListViewController!
    var boxListVC: BoxListViewController!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initSubViews()
//        api_getList()
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        shopListVC.view.frame = CGRect(x: 0, y: 0, width: Tools.kScreenWidth(), height: scrollView.height)
        boxListVC.view.frame = CGRect(x: Tools.kScreenWidth(), y: 0, width: Tools.kScreenWidth(), height: scrollView.height)
    }
    
    override func initSubViews() {
        self.view.backgroundColor = UIColor.kRGB(R: 230, G: 240, B: 247)
        
        let navView = UIView(frame: CGRect(x: 20, y: 0, width: Tools.kScreenWidth()*0.7, height: 44))
        navView.backgroundColor = .white
       
        
        let shopButton = UIButton(type: .custom)
        shopButton.setTitle("商品", for: .normal)
        shopButton.titleLabel?.font = UIFont.Medium(size: 15)
        shopButton.setTitleColor(UIColor.kColor(RGB: 56), for: .normal)
        shopButton.frame = CGRect(x: 0, y: 0, width: 60, height: 44)
        shopButton.addTarget(self, action: #selector(switchType), for: .touchUpInside)
        
        let boxButton = UIButton(type: .custom)
        boxButton.setTitle("盒子", for: .normal)
        boxButton.titleLabel?.font = UIFont.Medium(size: 15)
        boxButton.setTitleColor(UIColor.kColor(RGB: 56), for: .normal)
        boxButton.frame = CGRect(x: navView.width - 80, y: 0, width: 60, height: 44)
        boxButton.addTarget(self, action: #selector(switchType), for: .touchUpInside)
        
        navView.addSubview(shopButton)
        navView.addSubview(boxButton)
        
        let animationLine = UIView()
        animationLine.backgroundColor = UIColor.kColor(RGB: 56)
        animationLine.frame = CGRect(x: 0, y: 42, width: 54, height: 2)
        animationLine.centerX = shopButton.centerX
        navView.addSubview(animationLine)
        
        self.animationLine = animationLine
        self.shopButton = shopButton
        self.boxButton = boxButton
        self.switchButton = shopButton
        
        self.navigationItem.titleView = navView
        
        
        
        scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: Tools.kScreenWidth() * 2, height: 0)
        scrollView.bounces = false
        scrollView.isPagingEnabled = true
        scrollView.isScrollEnabled = false
        scrollView.showsHorizontalScrollIndicator = false
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        shopListVC = ShopListViewController()
        self.addChild(shopListVC)
        scrollView.addSubview(shopListVC.view)
        
        
        boxListVC = BoxListViewController()
        self.addChild(boxListVC)
        scrollView.addSubview(boxListVC.view)
    }
    
    @objc func switchType(btn: UIButton) {
        if switchButton == btn {
            return
        }
        switchButton = btn
        
        
        scrollView.setContentOffset(CGPoint(x: switchButton == shopButton ? 0 : Tools.kScreenWidth() , y: 0), animated: true)
        
        UIView.animate(withDuration: 0.25) {
            self.animationLine.centerX = self.switchButton.centerX
        }
    }
    

}

