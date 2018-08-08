//
//  ProfileItem.swift
//  Project03
//
//  Created by kuroky on 2018/8/8.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import Foundation

/// 我的
class ProfileItem {
    var cellType: ProfileCellType!
    var title: String!
    var imageName: String!
    var desc: String = "微信号：kkkkkkkkk"
    
    init(title: String, image: String, type: ProfileCellType) {
        self.title = title
        self.imageName = image
        self.cellType = type
    }
}

enum ProfileCellType: Int {
    case UserHead = 1
    case Photo = 2
}
