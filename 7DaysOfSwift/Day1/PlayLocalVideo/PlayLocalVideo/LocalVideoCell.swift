//
//  LocalVideoCell.swift
//  PlayLocalVideo
//
//  Created by kuroky on 2018/4/27.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import UIKit

struct LocalVideoItem {
    let coverImg: String
    let title: String
    let source: String
}

class LocalVideoCell: UITableViewCell {

    @IBOutlet weak var coverImgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCellItem(_ item: LocalVideoItem) {
        if coverImgView != nil {
            coverImgView.image = UIImage.init(named: item.coverImg)
        }
        
        if titleLabel != nil {
            titleLabel.text = item.title
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
