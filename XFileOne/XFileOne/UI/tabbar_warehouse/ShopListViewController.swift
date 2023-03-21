//
//  ShopListViewController.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/3/21.
//

import UIKit
import MJRefresh

class ShopListViewController: BaseViewController {

    var tableView: UITableView!
    var currentButton:UIButton! // 识别 商品的全部、已兑换、已提货、已赠送
    
    var page = 1     // 当前页数
    var limit = 30   // 每页数量
    var type = 0   // 类型：0全部 1已兑换 2已提货 3已赠送
    var dataSources: [JJWareHouseModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.kRGB(R: 230, G: 240, B: 247)
        initSubViews()
        api_getList(pageNum: 1)
    }
    
    override func initSubViews() {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .clear
        stackView.spacing = 15
        stackView.frame = CGRect(x: 16, y: 16, width: UIScreen.main.bounds.size.width - 32, height: Tools.kScaleUI(size: 28))
        view.addSubview(stackView)
        
        let titleList = ["全部","已兑换","已提货","已赠送"]
        for i in 0 ..< titleList.count {
            let btn = UIButton()
            btn.titleLabel?.font = UIFont.Medium(size: 13)
            btn.setTitleColor(.white, for: .normal)
            btn.frame = CGRect(x: 0, y: 0, width: Tools.kScaleUI(size: 72), height: Tools.kScaleUI(size: 28))
            btn.setBackgroundImage(UIImage(named: "ware_btn_bg_sel"), for: .selected)
            btn.setBackgroundImage(UIImage(named: "ware_btn_bg_nor"), for: .normal)
            btn.tag = 300 + i
            btn.setTitle(titleList[i], for: UIControl.State.normal)
            btn.addTarget(self, action: #selector(changeStatus(sender:)), for: .touchUpInside)
            stackView.addArrangedSubview(btn)
            if i == 0 {
                btn.isSelected = true
                currentButton = btn
            }
        }
        
        
        
        
        tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "WarehouseCell", bundle: nil), forCellReuseIdentifier: "WarehouseCell")
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.right.left.bottom.equalToSuperview()
            make.top.equalTo(stackView.snp.bottom).offset(8)
        }
        
        tableView.mj_header = MJRefreshHeader(refreshingBlock: {[weak self] () -> Void in
            self?.api_getList(pageNum: 1)
        })

        tableView.mj_footer = MJRefreshFooter(refreshingBlock: {
            print("111")
        })
        
        tableView.mj_footer = MJRefreshAutoNormalFooter(refreshingBlock: {[weak self] () -> Void in
//            self?.tableView.mj_footer?.endRefreshingWithNoMoreData()
//            self?.tableView.reloadData()
        })
        
        
    }
    @objc func changeStatus(sender: UIButton) {
        if sender != currentButton {
            currentButton.isSelected = false
            currentButton = sender
            currentButton.isSelected = true
        }
        let type = sender.tag - 300
        switchType(typeNum: type)
    }


}

extension ShopListViewController: UITableViewDataSource, UITableViewDelegate {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.dataSources.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WarehouseCell", for: indexPath) as! WarehouseCell
        cell.setProductModel(model: self.dataSources[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Tools.kScaleUI(size: 133)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
    }

    
}

extension ShopListViewController {
    

    
    /// 切换类型
    /// - Parameter typeNum: 类型 0全部 1已兑换 2提货 3赠送
    func switchType(typeNum: Int) {
        self.type = typeNum
        api_getList(pageNum: 1)
    }
    
    func api_getList(pageNum: Int) {
        self.page = pageNum
        IndiaServer.getStart().getTheShopList(withUserid: JJManager.shared.userId, page: String(page), limit: String(limit), type: String(type)) { [weak self] result, errMsg in
            self?.tableView.mj_header?.endRefreshing()
            if result != nil {
                let list = result! as [Any]
                if self?.page == 1 { // 如果是第一页， 清空所有数据，重新获取 , 否则视为 加载更多合并
                    self?.dataSources.removeAll()
                }
                if list.count < self?.limit ?? 30 { // 如果获取的数量少于 30个， 不能加载更多
                    self?.tableView.mj_footer?.endRefreshingWithNoMoreData()
                }
                for json in list {
                    let obj = JJWareHouseModel.initWithJson(json: json as! [String : Any])
                    self?.dataSources.append(obj)
                }
                self?.tableView.reloadData()
                
            }
        }
    }

}

        
    
