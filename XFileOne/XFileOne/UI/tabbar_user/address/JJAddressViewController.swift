//
//  JJAddressViewController.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/1/12.
//

import UIKit

class JJAddressViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        navigationItem.title = "地址管理"
        // Do any additional setup after loading the view.
        initSubViews()
    }
    
    override func initSubViews() {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "JJAddressCell", bundle: nil), forCellReuseIdentifier: "JJAddressCell")
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        
        let add = UIButton()
        add.backgroundColor = .black
        add.setTitle("添加收获地址", for: .normal)
        add.layer.cornerRadius = Tools.kScaleUI(size: 25)
        add.addTarget(self, action: #selector(addAddress), for: .touchUpInside)
        self.view.addSubview(add)
        
        add.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.bottom.equalTo(self.view).offset(-80)
            make.size.equalTo(CGSize(width: Tools.kScaleUI(size: 300), height: Tools.kScaleUI(size: 50)))
        }
    }
//    按钮事件
    // 新增地址
    @objc func addAddress() {
        navigationController?.pushViewController(JJAddressEditViewController(nibName: "JJAddressEditViewController", bundle: nil), animated: true)
    }

}
extension JJAddressViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JJAddressCell")
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(JJAddressEditViewController(nibName: "JJAddressEditViewController", bundle: nil), animated: true)
    }
    
    
}
