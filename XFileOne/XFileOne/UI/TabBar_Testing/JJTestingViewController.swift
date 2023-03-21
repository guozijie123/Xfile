//
//  JJTestingViewController.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2022/8/31.
//

import UIKit


class JJTestingViewController: BaseViewController {
    
    var tableView = UITableView()
    var dataSource: Array<String>!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "功能测试页面"
        dataSource = ["设置语言","字体","订单确认"]

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

extension JJTestingViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        switch indexPath.row {
        case 0:
            navigationController?.pushViewController(JJLanguageViewController(), animated: true)
        case 1:
            navigationController?.pushViewController(FontTestingViewController(), animated: true)
        case 2:
            navigationController?.pushViewController(JJOrderConfirmViewController(boxid: "1111"), animated: true)
        default:
            return
        }
        
    }
}
