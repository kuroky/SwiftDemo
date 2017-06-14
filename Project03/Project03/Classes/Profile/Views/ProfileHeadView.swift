//
//  ProfileHeadView.swift
//  Project03
//
//  Created by kuroky on 2017/6/14.
//  Copyright © 2017年 Kuroky. All rights reserved.
//

import UIKit

class ProfileHeadView: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    class func initFromNib() -> ProfileHeadView {
        let nibs = Bundle.main.loadNibNamed("ProfileHeadView", owner: nil, options: nil)
        let nibView:ProfileHeadView = nibs?.first as! ProfileHeadView
        nibView.frame = CGRect(x:0, y:0, width:kScreenWidth, height:200)
        return nibView
    }
}
