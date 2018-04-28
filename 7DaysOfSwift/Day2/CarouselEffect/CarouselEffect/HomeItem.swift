//
//  HomeItem.swift
//  CarouselEffect
//
//  Created by kuroky on 2018/4/28.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import UIKit

class HomeItem: NSObject {

    var title = ""
    var desc = ""
    var numberOfMembers = 0
    var numberOfPosts = 0
    var featuredImage = ""
    
    init(title: String, desc: String, featuredImage: String) {
        self.title = title
        self.desc = desc
        self.featuredImage = featuredImage
        numberOfPosts = 1
        numberOfMembers = 1
    }
    
    static func createItems() -> [HomeItem] {
        return [
            HomeItem(title: "Hello there, i miss u.", desc: "We love backpack and adventures! We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage:"hello"),
            HomeItem(title: "🐳🐳🐳🐳🐳", desc: "We love romantic stories. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage:"dudu"),
            HomeItem(title: "Training like this, #bodyline", desc: "Create beautiful apps. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage:"bodyline"),
            HomeItem(title: "I'm hungry, indeed.", desc: "Cars and aircrafts and boats and sky. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage:"wave"),
            HomeItem(title: "Dark Varder, #emoji", desc: "Meet life with full presence. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage:"darkvarder"),
            HomeItem(title: "I have no idea, bitch", desc: "Get up to date with breaking-news. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage:"hhhhh"),
        ]
    }
    
}
