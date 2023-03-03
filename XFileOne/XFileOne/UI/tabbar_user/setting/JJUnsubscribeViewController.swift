//
//  JJUnsubscribeViewController.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/1/31.
//  我的 - 设置 - 注销账号

import UIKit

class JJUnsubscribeViewController: BaseViewController {

    @IBOutlet weak var statusImageView: UIImageView!  // 勾选 Icon
    @IBOutlet weak var statusLabel: UILabel!     // 注销确认文本
    @IBOutlet weak var unsubscribeButton: UIButton! // 注销按钮
    
    var status: Bool = false {
        didSet {
            print("didSet", status)
            self.changeStatusIcon()
        }
        willSet {
            print("willSet")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "账号注销"
        status = false
        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        unsubscribeButton.layer.cornerRadius = unsubscribeButton.height/2
    }

    
    
//MARK: 方法
    func changeStatusIcon() {
        statusImageView.image = UIImage(named: status ? "user_unsubscribe_sel":"user_unsubscribe_nor")
    }
//MARK: 点击事件
    @IBAction func clickStatus(_ sender: Any) {
        status = !status
    }
    @IBAction func clickUnsubscribe(_ sender: Any) {
        JJPopView.initConfirmPopView(title: "注销账号", content: "注销后将清空账号", leftButtonTitle: "取消", rightButtonTitle: "确定", leftCallback: nil) {
            JJNetworkManager.API_POST(url: "cancelaccount", postParmas: ["":""]) { Json in
                
            } fail: { msg in
                
            }

        }
    }
}
