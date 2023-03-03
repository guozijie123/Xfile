//
//  SettingItemCell.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/1/31.
//

import UIKit

class SettingItemCell: UITableViewCell {

    @IBOutlet weak var itemTitle: UILabel! // 标题
    @IBOutlet weak var itemDesc: UILabel!  // 描述
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
