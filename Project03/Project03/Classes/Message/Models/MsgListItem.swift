//
//  MsgListItem.swift
//  Project03
//
//  Created by kuroky on 2018/8/7.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import Foundation

/// 消息首页
struct MsgListData: Codable {
    var code: Int?
    var message: String?
    var data: [MsgListItem]?
}

/// 消息列表item
struct MsgListItem: Codable {
    
    /// 头像
    var middleImageURL: String?
    
    /// 未读消息数
    var unreadNumber: Int = 0
    
    /// 昵称
    var nickname: String?
    
    /// 来源
    var messageFromType: MessageFromType?
    
    /// 消息id
    var chatId: String?  //每个人，群，公众帐号都有一个 uid，统一叫 chatId
    
    /// 最新一条消息
    private var latestMessage: MsgItem? //当且仅当消息类型为 Text 的时候，才有数据，其他类型需要本地造
    
    /// 最新一条消息类型
    var messageContentType: MessageContentType? {
        return latestMessage?.messageContentType
    }
    
    /// 最新一条消息时间
    var dateString: String? {
        return Date.dateFromInterval(interval: (latestMessage?.timestamp)!).stringFromDate()
        //return "2018-04-09" //latestMessage?.timestamp
    }

    /// 最新一条消息文字
    var lastMessage: String? {
        get {
            switch (self.messageContentType) {
            case .Text?, .System?:
                return (self.latestMessage?.message)!
            case .Image?:
                return "[图片]"
            case .Voice?:
                return "[语音]"
            case .File?:
                return "[文件]"
            default:
                return ""
            }
        }
    }
}

extension MsgListItem {
    private enum CodingKeys: String, CodingKey {
        case middleImageURL = "avatar_url"
        case unreadNumber = "message_unread_num"
        case nickname
        case messageFromType = "meesage_from_type"
        case chatId = "userid"
        case latestMessage = "last_message"
    }
}

/// 单条消息item
struct MsgItem: Codable {
    
    /// 消息ID
    var messageId: String?
    
    /// 接受人ID
    var receiveUserId: String?
    
    /// 发送人ID
    var sendUserId: String?
    
    /// 消息创建时间
    var cTime: String?
    
    /// 消息送达时间戳
    var timestamp: Int = 0
    
    /// 消息类型
    var messageContentType: MessageContentType?
    
    /// 客户端ID
    var clientMessageId : String?
    
    /// 消息内容文字
    var message: String?
    
    /// 设备
    var device: String?
}

extension MsgItem {
    private enum CodingKeys: String, CodingKey {
        case messageId = "message_id"
        case receiveUserId = "receive_userid"
        case sendUserId = "send_userid"
        case cTime = "ctime"
        case timestamp = "timestamp"
        case messageContentType = "message_content_type"
        case clientMessageId = "client_message_id"
        case message
        case device
    }
}

/// 消息类型
enum MessageContentType: String, Codable {
    
    /// 文本
    case Text = "0"
  
    /// 图片
    case Image = "1"
    
    /// 语音
    case Voice = "2"
    
    /// 系统
    case System = "3"

    /// 文件
    case File = "4"
    
    /// 时间
    case Time = "110"
}

/// 消息来源类型
enum MessageFromType: String, Codable {
    
    /// 系统
    case System = "0"
    
    /// 个人
    case Personal = "1"
    
    /// 群组
    case Group  = "2"
    
    /// 服务号
    case PublicServer = "3"
    
    /// 订阅号
    case PublicSubscribe = "4"
}


