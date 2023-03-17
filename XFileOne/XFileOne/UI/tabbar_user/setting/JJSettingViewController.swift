//
//  JJSettingViewController.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2022/9/1.
//

import UIKit
import SwiftUI

class JJSettingViewController: BaseViewController {
    var tableView: UITableView!
    var dataSource: Array<String>!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "设置".localized
        dataSource = ["手机绑定","消息通知","关于我们","检查更新","日志反馈","注销账号"]
    
        
        
        initSubViews()
    }
    override func initSubViews() {
        self.view.backgroundColor = UIColor.kColor(RGB: 249)
        
        tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.kColor(RGB: 249)
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.sectionFooterHeight = 2
        tableView.sectionHeaderHeight = 0
        tableView.contentInset = UIEdgeInsets(top: -34, left: 0, bottom: 0, right: 0)
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.register(UINib(nibName: "SettingItemCell", bundle: nil), forCellReuseIdentifier: "SettingItemCell")
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        
        // 退出登录View
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 85))
        footerView.backgroundColor = .clear
        
        let signout = UIButton(frame: CGRect(x: 0, y: 0, width: Tools.kScaleUI(size: 290), height: Tools.kScaleUI(size: 45)))
        signout.layer.cornerRadius = Tools.kScaleUI(size: 45/2)
        signout.setTitle("退出登录", for: .normal)
        signout.titleLabel?.font = UIFont.Bold(size: 17)
        signout.setTitleColor(UIColor.kRGB(R: 112, G: 50, B: 6), for: .normal)
        signout.backgroundColor = UIColor.kRGB(R: 223, G: 187, B: 127)
        signout.addTarget(self, action: #selector(logout), for: .touchUpInside)
        
        footerView.addSubview(signout)
        signout.center = footerView.center
        
        tableView.tableFooterView = footerView
    }
    override func viewDidLayoutSubviews() {
        print("1111",tableView.contentInset)
    }
}

extension JJSettingViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingItemCell", for: indexPath) as! SettingItemCell
        cell.itemTitle.text = dataSource[indexPath.section]
        cell.itemDesc.isHidden = true
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Tools.kScaleUI(size: 41)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        switch (indexPath.section) {
        case 2:
            navigationController?.pushViewController(JJAboutUsViewController(nibName: "JJAboutUsViewController", bundle: nil), animated: true)
        case 3:
            JJPopView.initMessagePopView(title: "提示", content: "当前已经是最新版本",callback: nil)
        case 4:
            JJPopView.initConfirmPopView(title: "日志", content: "确认上传日志？", leftButtonTitle: "取消", rightButtonTitle: "立即上传", leftCallback: nil) {
                print("立即上传")
            }

        case 5:
            navigationController?.pushViewController(JJUnsubscribeViewController.init(nibName: "JJUnsubscribeViewController", bundle: nil), animated: true)
            
        default: break
        }
        
    }

    
}

extension JJSettingViewController {
    
    @objc func logout() {
        
        JJPopView.initConfirmPopView(title: "提示", content: "确定推出登录？", leftButtonTitle: "取消", rightButtonTitle: "确定", leftCallback: nil) {
            JJManager.shared.logout()
            JJToast.toast(content: "登出成功")
        }
    }
}
