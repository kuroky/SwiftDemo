//
//  TestModel.swift
//  Project01
//
//  Created by kuroky on 2018/7/26.
//  Copyright © 2018年 kruoky. All rights reserved.
//

import Foundation

struct EventList: Codable {
    var count: Int?
    var next: String?
    var previous: String?
    var results: [Item]?
}

struct Item: Codable {
    var itemId: Int?
    
    var creator: CreatorItem?
    
    var title: String?
    var description: String?
    var overview: String?
    
    var tags: [String]?
    
    var imageSource: String?
    var bannerURL: String?
    var thumbURL: String?
    
    var persons: [PersonItem]?
    
    var lastThread: LastThread?
    
    var threadsCount: Int?
    var updateAt: String?
    var publishAt: String?
    
    var reactions: [Reaction]?
    
    private enum CodingKeys: String, CodingKey {
        case itemId = "id"
        case creator
        case title
        case description
        case overview
        case tags
        case imageSource = "image_source"
        case bannerURL = "banner_url"
        case thumbURL = "thumb_url"
        case persons
        case lastThread = "last_thread"
        case threadsCount = "threads_count"
        case updateAt = "update_at"
        case publishAt = "publish_at"
        case reactions
    }
}

struct CreatorItem: Codable {
    var name: String?
}

struct PersonItem: Codable {
    var avatarUrl: String?
    var name: String?
    var title: String?
    var status: String?
    var updateAt: String?
    
    private enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_url"
        case name
        case title
        case status
        case updateAt = "update_at"
    }
}

struct LastThread: Codable {
    var threadId: Int
    var title: String?
    var linkTitle: String?
    var eventDate: String?
    var eventTime: String?
    
    private enum CodingKeys: String, CodingKey {
        case threadId = "id"
        case title
        case linkTitle = "link_title"
        case eventDate = "event_date"
        case eventTime = "event_time"
    }
}

struct Reaction: Codable {
    var reaction: String?
    var count: Int?
}










