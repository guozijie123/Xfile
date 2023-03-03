//
//  JJOrderViewController.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/1/30.
//

import UIKit

class JJOrderViewController: BaseViewController {

    var placeholderBackground: UIImageView!
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white

        initSubViews()
        // Do any additional setup after loading the view.
    }
    
    override func initSubViews() {
        placeholderBackground = UIImageView(image: UIImage(named: "user_orderBackground"))
        view.addSubview(placeholderBackground)
        placeholderBackground.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        // tableView
//        tableView = UITableView(frame: CGRectZero, style: .plain)
//        tableView.backgroundColor = UIColor.lightGray
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.register(UINib(nibName: "UnpaidCell", bundle: nil), forCellReuseIdentifier: "UnpaidCell") // 代付款Cell
//        view.addSubview(tableView)
//        tableView.snp.makeConstraints { make in
//            make.edges.equalTo(view)
//        }
    }
    

}

extension JJOrderViewController: UITableViewDataSource, UITableViewDelegate {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let UnpaidCell = tableView.dequeueReusableCell(withIdentifier: "UnpaidCell", for: indexPath)
            
        return UnpaidCell
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Tools.kScaleUI(size: Tools.kScaleUI(size: 210))
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        JJToast.toast(content: "功能尚未开发")
        
    }
}
