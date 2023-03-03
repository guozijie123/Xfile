//
//  JJLanguageViewController.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2022/8/31.
//

import UIKit

class JJLanguageViewController: BaseViewController {
    var tableView = UITableView()
    var dataSource: Array<(String,String)>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "设置语言"
        dataSource = LanguageManager.shareInstance.languageList
        initSubViews()
    }
    override func initSubViews() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
}

extension JJLanguageViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = (dataSource[indexPath.row]).0
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let name = (dataSource[indexPath.row]).1
        if (LanguageManager.shareInstance.currentLanguage != name) {
            LanguageManager.shareInstance.currentLanguage = name
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1) {
                UIView.animate(withDuration: 0.4) {
                    UIApplication.shared.keyWindow?.alpha = 0
                }completion: { isFinished in
                    UIApplication.shared.keyWindow?.rootViewController = BaseTabBarController()
                    UIView.animate(withDuration: 0.4) {
                        UIApplication.shared.keyWindow?.alpha = 1
                    }
                }
            }
        }
        
    }
}
