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
        if let model = self.detailModel {
            bottomView.setPayDetail(model: model)
        }
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
        
    }
}

extension JJOrderConfirmViewController {
    
    @objc func payButtonAction(){
        
        print("前往购买")
        
    }
    
    func api_getDetail() {
        IndiaServer.getStart().getThePayDetail(with: self.boxid, userid: JJManager.shared.userId) { [weak self] result, error in
            if (result != nil){
                let model = payConfirmModel.initWithJson(json: result ?? [:])
                self?.detailModel = model
                self?.bottomView.total.text = model.amount
                self?.tableView.reloadData()
            }
        }
    }
}
