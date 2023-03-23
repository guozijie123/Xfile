//
//  JJRecordViewController.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/1/30.
//  开盒记录

import UIKit

class JJRecordViewController: BaseViewController {

    var placeholderBackground: UIImageView!
    var tableView: UITableView!
    
    
    var page = 1     // 当前页数
    var limit = 30   // 每页数量
    var dataSources: [JJBoxModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "开盒记录"
        // Do any additional setup after loading the view.
        initSubViews()
        api_getBoxList()
    }
    
    override func initSubViews() {
        // 背景图
        let _backgroundImageView = UIImageView(image: UIImage(named: "user_background"))
        view.addSubview(_backgroundImageView)
        _backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        // 缺省图（没有数据的时候 hide = false）
        placeholderBackground = UIImageView(image: UIImage(named: "user_recordBackground"))
        view.addSubview(placeholderBackground)
        placeholderBackground.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        placeholderBackground.isHidden = true
        
        let button = UIButton(type: .custom)
        button.setTitleColor(UIColor.kColor(RGB: 124), for: .normal)
        button.titleLabel?.font = UIFont.Bold(size: 14)
        button.setTitle("前往仓库", for: .normal)
        let customNavigation = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = customNavigation
        
        weak var weakSelf = self
        button.addActionWithBlock { sender in
            weakSelf?.tabBarController?.selectedIndex = 2
            weakSelf?.navigationController?.popViewController(animated: false)
        }
        
        
        tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "boxRecordCell", bundle: nil), forCellReuseIdentifier: "boxRecordCell")
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        
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
extension JJRecordViewController: UITableViewDataSource, UITableViewDelegate {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.dataSources.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "boxRecordCell", for: indexPath) as! boxRecordCell
        cell.setBoxModel(box: self.dataSources[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Tools.kScaleUI(size: 133)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
    }

    
}

extension JJRecordViewController {
    
    func api_getBoxList() {
        IndiaServer.getStart().getTheOpenBoxList(withUserid: JJManager.shared.userId, page: String(page), limit: String(limit)) { [weak self]result, msg in
            if result != nil {
                let list = result! as [Any]
                
                for json in list {
                    let obj = JJBoxModel.initWithJson(json: json as! [String : Any])
                    self?.dataSources.append(obj)
                }
                self?.tableView.reloadData()
            }
        }
    }
}
