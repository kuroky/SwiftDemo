//
//  MsgSortListCell.swift
//  Project03
//
//  Created by kuroky on 2017/6/15.
//  Copyright © 2017年 Kuroky. All rights reserved.
//

import UIKit

class MsgSortListCell: UITableViewCell {

    @IBOutlet weak var headImgView: UIImageView!
    @IBOutlet weak var unreadCountLabel: UILabel!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.headImgView.mx_drawCorner(viewSize: CGSize(width: 48, height: 48), corners: .allCorners, radius: 2.0)
        self.unreadCountLabel.mx_drawCorner(viewSize: CGSize(width: 18, height: 18), corners: .allCorners, radius: 9.0)
    }

    func configMsgItem(msgItem: MsgListItem) {
        self.unreadCountLabel.isHidden = msgItem.unreadNumber > 0 ? false : true
        self.unreadCountLabel.text = msgItem.unreadNumber > 99 ? "99" : String(msgItem.unreadNumber)
        self.nicknameLabel.text = msgItem.nickname
        self.contentLabel.text = msgItem.lastMessage
        self.timeLabel.text = msgItem.dateString
        
        self.headImgView.mx_setImageWithURL(urlString: msgItem.middleImageURL, fittedSize: CGSize(width: 48, height: 48), placeholder: nil)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
