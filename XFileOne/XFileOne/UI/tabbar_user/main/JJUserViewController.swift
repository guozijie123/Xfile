//
//  JJUserViewController.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2022/8/31.
//

import UIKit

class JJUserViewController: BaseViewController {

    var userPhoneLabel: UILabel!
    var userIdLabel: UILabel!
    var tableView: UITableView!
    
    var dataSource: Array<(String,String)>!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateUserInfo()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vhl_navBarHide = true
        initSubViews()
        
        
    }

    
    override func initSubViews() {
        let backgroundView = UIImageView(image: UIImage(named: "user_background"))
        backgroundView.frame = UIScreen.main.bounds
        view.addSubview(backgroundView)
        
        // tableView
        tableView = UITableView(frame: CGRectZero, style: .grouped)
        tableView.backgroundColor = UIColor.clear
        tableView.separatorStyle = .none
        tableView.sectionFooterHeight = 8
        tableView.sectionHeaderHeight = 8
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "VIPCell", bundle: nil), forCellReuseIdentifier: "VIPCell")
        tableView.register(UINib(nibName: "OrderCell", bundle: nil), forCellReuseIdentifier: "OrderCell")
        tableView.register(UINib(nibName: "UserItemACell", bundle: nil), forCellReuseIdentifier: "UserItemACell")
        tableView.register(UINib(nibName: "UserItemBCell", bundle: nil), forCellReuseIdentifier: "UserItemBCell")
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.bottom.equalTo(view)
            make.left.equalTo(view).offset(16)
            make.right.equalTo(view).offset(-16)
        }
        // headerView
        let header = UIView(frame: CGRect(x: 0, y: 0, width:UIScreen.main.bounds.size.width , height: Tools.kScaleUI(size: 100)))
        header.backgroundColor = .clear
        tableView.tableHeaderView = header
        
        let userImage = UIImageView(frame: CGRect(x: 8, y: header.height - Tools.kScaleUI(size: 50) - 8, width: Tools.kScaleUI(size: 50), height: Tools.kScaleUI(size: 50)))
        userImage.image = UIImage(named: "user_image")
        userImage.layer.cornerRadius = Tools.kScaleUI(size: 30)
        header.addSubview(userImage)
        
        let line = UIView()
        line.backgroundColor = UIColor.clear
        header.addSubview(line)
        line.snp.makeConstraints { make in
            make.centerY.equalTo(userImage)
            make.height.equalTo(1)
            make.left.right.equalTo(header)
        }
        
        let userPhone = UILabel()
        userPhone.text = "155****6078"
        userPhone.font = UIFont.Regular(size: 17)
        userPhone.textColor = UIColor.kRGB(R: 39, G: 42, B: 51)
        header.addSubview(userPhone)
        userPhoneLabel = userPhone
        
        let userId = UILabel()
        userId.text = "ID:7901"
        userId.font = UIFont.Regular(size: 13)
        userId.textColor = UIColor.kColor(RGB: 140)
        header.addSubview(userId)
        userIdLabel = userId
        
        userPhone.snp.makeConstraints { make in
            make.left.equalTo(userImage.snp.right).offset(10)
            make.bottom.equalTo(line.snp.top)
        }
        userId.snp.makeConstraints { make in
            make.top.equalTo(line.snp.bottom)
            make.left.equalTo(userImage.snp.right).offset(10)
        }
    }
}

extension JJUserViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath.section)  {
        case 0:
            let VIPCell = tableView.dequeueReusableCell(withIdentifier: "VIPCell", for: indexPath)
            return VIPCell
        case 1:
            let OrderCell = tableView.dequeueReusableCell(withIdentifier: "OrderCell", for: indexPath)
            return OrderCell
        case 2:
            let UserItemACell = tableView.dequeueReusableCell(withIdentifier: "UserItemACell", for: indexPath)
            return UserItemACell
        case 3:
            let UserItemBCell = tableView.dequeueReusableCell(withIdentifier: "UserItemBCell", for: indexPath)
            return UserItemBCell
        default:
            return UITableViewCell()
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch (indexPath.section) {
        case 0:
            return Tools.kScaleUI(size: 122)
        case 1:
            return Tools.kScaleUI(size: 144)
        case 2:
            return Tools.kScaleUI(size: 74)
        case 3:
            return Tools.kScaleUI(size: 140)
        default:
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        JJToast.toast(content: "功能尚未开发")
        
    }
}

extension JJUserViewController {
    
    @objc func userSetting() {
//        navigationController?.pushViewController(JJSettingViewController(), animated: true)
    }
    
    // 更新用户信息
    func updateUserInfo() {
        let user = JJUser.shared
        self.userPhoneLabel.text = user.phone
        self.userIdLabel.text = "ID：" + String(user.userid)
    }
}
