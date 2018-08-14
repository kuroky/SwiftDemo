//
//  ContactFootView.swift
//  Project03
//
//  Created by kuroky on 2018/8/14.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import UIKit

class ContactFootView: UIView {
    
    @IBOutlet weak var countLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configCount(count: Int?) {
        guard let people = count else {
            self.countLabel.text = "0位联系人"
            return
        }
        
        self.countLabel.text = String(people) + "位联系人"
    }
}
