//
//  FontTestingViewController.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2022/8/31.
//

import UIKit

class FontTestingViewController: BaseViewController {
    var tableView = UITableView()
    var dataSource: Array<(String,UIFont)>!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "字体大小适配"
        dataSource = [("Regular Size: 15",UIFont.Regular(size: 15)),("Medium Size: 16",UIFont.Medium(size: 16)),("Bold Size: 17",UIFont.Bold(size: 17)),("Light Size: 18",UIFont.Light(size: 18)),("Thin Size: 19",UIFont.Thin(size: 19)),("Ultralight Size: 20",UIFont.Ultralight(size: 20))];

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

extension FontTestingViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let obj = dataSource[indexPath.row]
        cell.textLabel?.text = obj.0
        cell.textLabel?.font = obj.1
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

