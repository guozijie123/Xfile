//
//  BoxListViewController.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/3/21.
//

import UIKit

class BoxListViewController: BaseViewController {

    var page = 1     // 当前页数
    var limit = 30   // 每页数量
    
    var dataSources: [JJBoxModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
        
        api_getBoxList()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension BoxListViewController {
    
    func api_getBoxList() {
        IndiaServer.getStart().getTheOpenBoxList(withUserid: JJManager.shared.userId, page: String(page), limit: String(limit)) { [weak self]result, msg in
            if result != nil {
                let list = result! as [Any]
                
                for json in list {
                    let obj = JJBoxModel.initWithJson(json: json as! [String : Any])
                    self?.dataSources.append(obj)
                }
//                self?.tableView.reloadData()
            }
        }
    }
}
