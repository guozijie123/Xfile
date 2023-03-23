//
//  WareProductViewController.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/2/27.
//

import UIKit

class WareProductViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "商品兑换"
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
    
    func api_getDetail() {
        IndiaServer.getStart().getTheUserServersRoomLink()
    }

}
