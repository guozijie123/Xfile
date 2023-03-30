//
//  CouponSelectorViewController.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/3/30.
//

import UIKit

//typealias selectedCallback = (() -> Void)

class CouponSelectorViewController: BaseViewController {

    var tableView: UITableView!
    var payModel: payConfirmModel?
    var selectedBlock: ((Int) ->Void)? // 回调
    
    static func initWithPayConfirm(model: payConfirmModel, selectedBlock: @escaping ((Int)) -> Void) -> CouponSelectorViewController {
        let vc = CouponSelectorViewController()
        vc.payModel = model
        vc.selectedBlock = selectedBlock
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initSubViews()
        // Do any additional setup after loading the view.
    }

    override func initSubViews() {
        
        self.tableView = UITableView(frame: .zero, style: .plain)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = .clear
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.separatorStyle = .none
        self.tableView.register(UINib(nibName: "OrderCouponCell", bundle: nil), forCellReuseIdentifier: "OrderCouponCell")
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

extension CouponSelectorViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.payModel?.couponList.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderCouponCell", for: indexPath) as! OrderCouponCell
        if let coupon = self.payModel?.couponList[indexPath.row] {
            cell.textLabel?.text = String(coupon.discount)
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Tools.kScaleUI(size: 40)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let coupon = self.payModel!.couponList[indexPath.row]
        // 切换优惠券
        if coupon != self.payModel!.selectedCoupon {
            self.payModel!.selectedCoupon = coupon
        }
        if self.selectedBlock != nil {
            self.selectedBlock!(indexPath.row)
        }
        self.dismiss(animated: true)
//        tableView.deselectRow(at: indexPath, animated: false)
        
    }
}
