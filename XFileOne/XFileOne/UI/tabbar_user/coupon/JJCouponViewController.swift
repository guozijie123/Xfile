//
//  JJCouponViewController.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/2/2.
//

import UIKit

class JJCouponViewController: BaseViewController {

    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "优惠券"
        // Do any additional setup after loading the view.
        initSubViews()
    }
    

    override func initSubViews() {
        // tableView
        tableView = UITableView(frame: CGRectZero, style: .plain)
        tableView.backgroundColor = UIColor.kRGB(R: 219, G: 227, B: 232)
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CouponCell", bundle: nil), forCellReuseIdentifier: "CouponCell")
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }

}



extension JJCouponViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let CouponCell = tableView.dequeueReusableCell(withIdentifier: "CouponCell", for: indexPath)
        return CouponCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Tools.kScaleUI(size: 128)
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        JJToast.toast(content: "功能尚未开发")
        
    }
}
