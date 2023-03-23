//
//  BoxListViewController.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/3/21.
//

import UIKit

class BoxListViewController: BaseViewController {

    var tableView: UITableView!
    
    var page = 1     // 当前页数
    var limit = 30   // 每页数量
    
    var dataSources: [JJBoxModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initSubViews()
//        api_getBoxList()
    }
    

    override func initSubViews() {
        let _backgroundImageView = UIImageView(image: UIImage(named: "user_background"))
        view.addSubview(_backgroundImageView)
        _backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "WarehouseBoxCell", bundle: nil), forCellReuseIdentifier: "WarehouseBoxCell")
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}

extension BoxListViewController: UITableViewDataSource, UITableViewDelegate {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WarehouseBoxCell", for: indexPath) as! WarehouseBoxCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Tools.kScaleUI(size: 133)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
    }

    
}


extension BoxListViewController {
    
    func api_getBoxList() {
        IndiaServer.getStart().getTheOpenBoxList(withUserid: JJManager.shared.userId, page: String(page), limit: String(limit)) { [weak self]result, msg in
            if result != nil {
                let list = result! as [Any]
                
                for json in list {
                    let obj = JJBoxModel.initWithJson(json: json as! [String : Any])
                    self?.dataSources.append(obj)
                }
//                self?.tableView.reloadData()
            }
        }
    }
}
