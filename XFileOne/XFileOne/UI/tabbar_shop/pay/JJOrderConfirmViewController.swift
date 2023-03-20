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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "订单确认"
        // Do any additional setup after loading the view.
        
        initSubViews()
    }
    override func initSubViews() {
        self.view.backgroundColor = UIColor.kRGB(R: 230, G: 240, B: 247)
        

        bottomView = (UINib(nibName: "OrderConfirmPayView", bundle: nil).instantiate(withOwner: nil).first as! OrderConfirmPayView)
        view.addSubview(bottomView)
        bottomView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(Tools.kScaleUI(size: 150))
        }
        
        tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "JJPayProductInfoCell", bundle: nil), forCellReuseIdentifier: "JJPayProductInfoCell")
        tableView.register(UINib(nibName: "JJPayStyleCell", bundle: nil), forCellReuseIdentifier: "JJPayStyleCell")
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.bottom.equalTo(bottomView.snp.top)

        }
        

//        let vie = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height:  Tools.kScaleUI(size: 292)))
//        vie.backgroundColor = UIColor.red
//
//        headerView = ((UINib(nibName: "OrderConfirmHeaderView", bundle: nil).instantiate(withOwner: nil).first) as! OrderConfirmHeaderView)
//        tableView.tableHeaderView = headerView
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

    
}
