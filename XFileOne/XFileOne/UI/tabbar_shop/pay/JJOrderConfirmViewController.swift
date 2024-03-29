//
//  JJOrderConfirmViewController.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/3/20.
//

import UIKit

class JJOrderConfirmViewController: BaseViewController {

    var tableView: UITableView!
    var bottomView: OrderConfirmPayView!
    var boxid: String? // boxid
    var payIndex = 0 // 支付方式Index
    
    
    var detailModel: payConfirmModel? // 订单详情
    
    required init(boxid: String) {
        self.boxid = boxid
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "订单确认"
        // Do any additional setup after loading the view.
        
        initSubViews()
        
        api_getDetail()
    }
    override func initSubViews() {
        self.view.backgroundColor = UIColor.kRGB(R: 230, G: 240, B: 247)
        

        bottomView = (UINib(nibName: "OrderConfirmPayView", bundle: nil).instantiate(withOwner: nil).first as! OrderConfirmPayView)
        bottomView.payButton.addTarget(self, action:#selector(payButtonAction) , for: .touchUpInside)
        view.addSubview(bottomView)
        bottomView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(Tools.kScaleUI(size: 150))
        }
        
        self.tableView = UITableView(frame: .zero, style: .plain)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = .clear
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.separatorStyle = .none
        self.tableView.register(UINib(nibName: "JJPayProductInfoCell", bundle: nil), forCellReuseIdentifier: "JJPayProductInfoCell")
        self.tableView.register(UINib(nibName: "JJPayStyleCell", bundle: nil), forCellReuseIdentifier: "JJPayStyleCell")
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.bottom.equalTo(self.bottomView.snp.top)

        }
    }
    
}

extension JJOrderConfirmViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "JJPayProductInfoCell", for: indexPath) as! JJPayProductInfoCell
            if let model = self.detailModel {
                cell.setPayDetail(model: model)
                cell.couponContainerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapCoupon)))
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "JJPayStyleCell", for: indexPath) as! JJPayStyleCell
            if indexPath.row == 0 {
                cell.setSelected(true, animated: false)
            }
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? Tools.kScaleUI(size: 292) : Tools.kScaleUI(size: 40)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: false)
        if indexPath.section == 0 {
            tableView.selectRow(at: IndexPath(row: payIndex, section: 1), animated: false, scrollPosition: .none)
        }else {
            self.payIndex = indexPath.row
        }
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        return view
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0 : 10
    }
}

extension JJOrderConfirmViewController {
    
    func reloadTableView() {
        self.tableView.reloadData()
        self.tableView.selectRow(at: IndexPath(row: payIndex, section: 1), animated: false, scrollPosition: .none)
    }
    
    @objc func tapCoupon() {
        if self.detailModel != nil {
            let viewController = CouponSelectorViewController.initWithPayConfirm(model: self.detailModel!) {[weak self] index in
                self?.reloadTableView()
            }
            Tools.getTopViewController()?.navigationController?.present(viewController, animated: true)
        }
    }
    
    @objc func payButtonAction(){
        
        print("前往购买")
        /*
         购买金额
         实际支付金额
         优惠券id
         用户ID
         渠道id
         盒子id
         数量
         
         */
        let amount = String(self.detailModel?.amount ?? 0.0)
        let payAmount = String(self.detailModel?.payAmount ?? 0.0)
        IndiaServer.getStart().pushTheAmount(amount, payAmount: payAmount, couponid: self.detailModel?.couponList.first?.couponid, userid: JJUser.shared.userid, channelId: "1", boxid: self.detailModel?.boxid, count: "1") { payUrl, payOrder, error in
            
            
            if payUrl != nil{
                self.navigationController?.pushViewController(JJWebViewController(urlStr: payUrl ?? "", urlTitle: "订单支付"), animated: true)
            }
            
            
        }
        
        
        
    }
    
    func api_getDetail() {
        IndiaServer.getStart().getThePayDetail(with: self.boxid, userid: JJManager.shared.userId) { [weak self] result, error in
            if (result != nil){
                let model = payConfirmModel.initWithJson(json: result ?? [:])
                self?.detailModel = model
                self?.bottomView.total.text = String(self?.detailModel!.payAmount ?? 0.0)
                self?.reloadTableView()
            }
        }
    }
}
