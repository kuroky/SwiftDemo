//
//  DetailCell.swift
//  Project02
//
//  Created by kuroky on 2017/6/14.
//  Copyright © 2017年 Kuroky. All rights reserved.
//

import UIKit
import Kingfisher

class DetailCell: UITableViewCell {

    @IBOutlet var coverImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configCellItem(_ item: DetailItem) -> Void {
        self.titleLabel.text = "title: ".appending(item.title)
        self.contentLabel.text = "content: ".appending(item.content)
        
        let url = URL.init(string: item.coverUrl)
        self.coverImageView.kf.setImage(with: url)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
