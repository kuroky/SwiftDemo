//
//  TestCell.swift
//  Project05
//
//  Created by kuroky on 2018/3/5.
//  Copyright © 2018年 Emucoo. All rights reserved.
//

import UIKit

class TestCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configCellItem(_ item: AnyObject) {
        textLabel?.text = "12"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
