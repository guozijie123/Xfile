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
    
    
    var amount: String? //金额
    var detail: String? //描述
    var boxTitle: String? //名称
    var img: String? //盒子图片
    var couponDetail: Array<Any>? //优惠券列表
    var couponAmount: String? //优惠价格
    
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
        
        
        print("%@",JJManager.shared.userId);
        IndiaServer.getStart().getThePayDetail(with: self.boxid, userid: JJManager.shared.userId) { result, error in
            
            print("%@",result ?? "~~~~")
            if (result != nil){
                self.amount = result?["amount"] as? String
                self.detail = result?["introduce"] as? String
                self.boxTitle = result?["title"] as? String
                self.img = result?["img"] as? String
                
                if let arr = result?["couponList"] as? [Any], let dict = arr.first as? [String: Any], let discount = dict["discount"] as? String {
                    self.couponAmount = discount
                    // Do something with str
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
        
    }
    
}

extension JJOrderConfirmViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "JJPayProductInfoCell", for: indexPath) as! JJPayProductInfoCell
            cell.buy_count.text = "1"
            cell.buy_discounts.text = self.couponAmount
            cell.productName.text = self.boxTitle
            cell.productPrice.text = self.amount
            let amount = self.amount!
            let discount = self.couponAmount!
            cell.total.text = String(Int(amount)! - Int(discount)!)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "JJPayStyleCell", for: indexPath) as! JJPayStyleCell
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? Tools.kScaleUI(size: 292) : Tools.kScaleUI(size: 40)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
    }

    @objc func payButtonAction(){
        
        print("前往购买")
        
    }
    
    
}
