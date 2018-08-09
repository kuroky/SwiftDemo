//
//  ContactsCell.swift
//  Project03
//
//  Created by kuroky on 2018/8/9.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import UIKit

class ContactsCell: UITableViewCell {

    @IBOutlet weak var headImgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.headImgView.mx_drawCorner(viewSize: CGSize(width: 40, height: 40), corners: .allCorners, radius: 2.0)
    }
    
    func configContacts(contact: ContactsItem) {
        self.headImgView.mx_setImageWithURL(urlString: contact.avatarURL, fittedSize: CGSize(width: 40, height: 40), placeholder: nil)
        self.nameLabel.text = contact.name
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
