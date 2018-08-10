//
//  MsgActionCell.swift
//  Project03
//
//  Created by kuroky on 2018/8/10.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import UIKit

class MsgActionCell: UITableViewCell {

    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configActionItem(item: ActionItem) {
        self.titleLabel.text = item.title
        self.cellImageView.image = UIImage(named: item.image!)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
