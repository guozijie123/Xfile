//
//  CouponListViewController.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/3/30.
//

import UIKit

class CouponListViewController: BaseViewController {

    var isUsable = true
    var tableView: UITableView!
    
    var dataSource: [payCouponModel] = []

    
    static func initWithType(usable: Bool) -> CouponListViewController {
        let vc = CouponListViewController()
        vc.isUsable = usable
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initSubViews()
        get_couponDetail()
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



extension CouponListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let CouponCell = tableView.dequeueReusableCell(withIdentifier: "CouponCell", for: indexPath) as! CouponCell
        CouponCell.couponModel = dataSource[indexPath.row]
        return CouponCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Tools.kScaleUI(size: 128)
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        JJToast.toast(content: "功能尚未开发")

    }

    func get_couponDetail(){
        //此处需写死useriid 只有这个id才有数据
        IndiaServer.getStart().getTheUserCouponList(withUserid: "12", couponType: isUsable ? 1 : 2) { [weak self]result, error in
            if (result != nil){
                self?.dataSource.removeAll()
                let list = result as? Array ?? []
                for couponJson in list {
                    if let jsonDict = couponJson as? [String: Any] {
                        let model = payCouponModel.initWithJson(json: jsonDict)
                        self?.dataSource.append(model)
                    }
                }
                self?.tableView.reloadData()
            }
        }
    }
}
