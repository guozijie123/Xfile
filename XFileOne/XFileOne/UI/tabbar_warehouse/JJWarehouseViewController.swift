//
//  JJWarehouseViewController.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/1/11.
//

import UIKit

class JJWarehouseViewController: BaseViewController {

    var tableView: UITableView!
    var currentButton:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "商品"

        initSubViews()
        // Do any additional setup after loading the view.
    }
    
    override func initSubViews() {
        self.view.backgroundColor = UIColor.kRGB(R: 230, G: 240, B: 247)
        
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
        
    }
    
    @objc func changeStatus(sender: UIButton) {
        if sender != currentButton {
            currentButton.isSelected = false
            currentButton = sender
            currentButton.isSelected = true
        }
    }

}

extension JJWarehouseViewController: UITableViewDataSource, UITableViewDelegate {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WarehouseCell", for: indexPath) as! WarehouseCell
        cell.setStatus(status: indexPath.row+1)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Tools.kScaleUI(size: 133)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
    }

    
}

extension JJWarehouseViewController {
    

}
