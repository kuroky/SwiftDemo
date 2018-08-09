//
//  ContactsItem.swift
//  Project03
//
//  Created by kuroky on 2018/8/9.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import Foundation

/// 联系人数据
struct ContactsData: Codable {
    var message: String?
    var code: Int?
    var data: [[ContactsItem]]?
}

/// 联系人列表
struct ContactsItem: Codable {
    
    /// 手机号
    var phone: String?
    
    /// 名字拼写
    var nameSpell: String?
    
    /// 头像
    var avatarURL: String?
    
    /// 名字
    var name: String?
    
    /// 用户id
    var userId: String?
}

extension ContactsItem {
    private enum CodingKeys: String, CodingKey {
        case phone
        case nameSpell = "name_spell"
        case avatarURL = "avatar_url"
        case name
        case userId = "userid"
    }
}

let topContactsJson = """
[
    {
        "phone": "13581887557",
        "name_spell": "zhangsan",
        "avatar_url": "http://ww4.sinaimg.cn/large/6a011e49jw1f18hftp0foj2030030dfn.jpg",
        "name": "新的朋友",
        "userid": "wxid2132324"
    },
    {
        "phone": "13581887557",
        "name_spell": "liuyi",
        "avatar_url": "http://ww1.sinaimg.cn/large/6a011e49jw1f18hercci7j2030030glf.jpg",
        "name": "群聊",
        "userid": "wxid214123sdfasd"
    },
    {
        "phone": "13581887557",
        "name_spell": "zhangsan",
        "avatar_url": "http://ww2.sinaimg.cn/large/6a011e49jw1f18hh48jr3j2030030743.jpg",
        "name": "标签",
        "userid": "wxid2132324"
    },
    {
        "phone": "13581887557",
        "name_spell": "chener",
        "avatar_url": "http://ww2.sinaimg.cn/large/6a011e49jw1f18hkv6i5kj20300303yb.jpg",
        "name": "公众号",
        "userid": "wxid2123123sdd14"
    }
]
""".data(using: .utf8)!
