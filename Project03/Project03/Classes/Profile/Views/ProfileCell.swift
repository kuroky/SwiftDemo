//
//  ProfileCell.swift
//  Project03
//
//  Created by kuroky on 2018/8/8.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.accessoryType = .disclosureIndicator
    }
    
    func configDiscoverData(item: ProfileItem) {
        self.nameLabel.isHidden = item.cellType == .UserHead ? false : true
        self.descLabel.isHidden = item.cellType == .UserHead ? false : true
        self.titleLabel.isHidden = item.cellType == .UserHead ? true : false
        self.titleLabel.text = item.title
        self.nameLabel.text = item.title
        self.iconImageView.image = UIImage(named: item.imageName)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
