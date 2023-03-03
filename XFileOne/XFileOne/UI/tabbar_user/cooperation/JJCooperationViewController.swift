//
//  JJCooperationViewController.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/2/1.
//

import UIKit

class JJCooperationViewController: BaseViewController {

    @IBOutlet weak var submitButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "商务合作留言"
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
    override func viewDidLayoutSubviews() {
        submitButton.layer.cornerRadius = submitButton.height/2
    }
    @IBAction func clickSubmit(_ sender: Any) {
    }
    
}
