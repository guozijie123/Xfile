//
//  OrderManagerViewController.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/1/30.
//

import UIKit

class OrderManagerViewController: LLSegmentViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "订单管理"
        
        layoutContentView()
        loadController()
        setUpSegmentStyle()

        // Do any additional setup after loading the view.
    }
    
    func layoutContentView() {

        self.layoutInfo.segmentControlPositionType = .customFrame(segmentCtlFrame: CGRect(x: 0, y: 0, width: self.view.width, height: 50), containerFrame: CGRect(x: 0, y: 50, width: self.view.width, height: self.view.height - UIDevice.xp_navigationFullHeight() - UIDevice.xp_safeDistanceBottom()))
        self.relayoutSubViews()
    }
    
    func loadController() {
        let test1Ctl = JJOrderViewController()
        test1Ctl.title = "全部"
        test1Ctl.tabBarItem.badgeValue = nil
        
        let test2Ctl = JJOrderViewController()
        test2Ctl.title = "代付款"
        test2Ctl.tabBarItem.badgeValue = nil
        
        let test3Ctl = JJOrderViewController()
        test3Ctl.title = "待收货"
        test3Ctl.tabBarItem.badgeValue = nil
        
        let test4Ctl = JJOrderViewController()
        test4Ctl.title = "已完成"
        test4Ctl.tabBarItem.badgeValue = nil
        let ctls =  [test1Ctl,test2Ctl,test3Ctl,test4Ctl]
        reloadViewControllers(ctls:ctls)
        
    }
    
    func setUpSegmentStyle() {
        let itemStyle = LLSegmentItemTitleViewStyle()
        itemStyle.selectedColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 1)
        itemStyle.unSelectedColor = UIColor.init(red: 0.2, green: 0.4, blue: 0.8, alpha: 1)
        itemStyle.itemWidth = UIScreen.main.bounds.width/CGFloat(ctls.count)
        itemStyle.badgeValueLabelOffset = CGPoint.zero
        itemStyle.selectedStyle = .mid
        
        segmentCtlView.indicatorView.widthChangeStyle = .stationary(baseWidth: 30)
        var ctlViewStyle = LLSegmentedControlStyle()
        ctlViewStyle.segmentItemViewClass = LLSegmentItemTitleView.self
        ctlViewStyle.itemViewStyle = itemStyle
        segmentCtlView.ctlViewStyle = ctlViewStyle
        segmentCtlView.reloadData(ctlViewStyle: ctlViewStyle)
        segmentCtlView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
                
    }
    override func viewDidLayoutSubviews() {
        print("11",self.containerScrView.contentSize)
        print("1111:",self.view.frame)
        
        
        print("22",self.containerScrView.contentSize)
        print("2222:",self.view.frame)
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
