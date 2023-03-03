//
//  JJAddressEditViewController.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/1/12.
//

import UIKit

class JJAddressEditViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    // 保存地址
    @IBAction func clickSave(_ sender: Any) {
        
        let custom = JJAddressPopView.initPopView()
        JJPopView.initMainView(subView: custom)
    }
    
}
