//
//  JJAddressPopView.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/1/30.
//

import UIKit

class JJAddressPopView: UIView {

    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    static func initPopView() -> JJAddressPopView {
        let view = UINib(nibName: "JJAddressPopView", bundle: nil).instantiate(withOwner: nil).first as! JJAddressPopView
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width - 32, height: Tools.kScaleUI(size: 180))
        
        return view
    }
}
