//
//  PlaneOrder.swift
//  SwiftCodable
//
//  Created by kuroky on 2018/7/30.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import Foundation

//MARK:- 订单

/// 商品详情
struct Item: Codable, Hashable {
    var name: String
    var unitPrice: Int
}

/// 订单详情
struct Order: Codable {
    /// 座位号
    var seat: String
    
    /// 某个商品的订单
    struct LineItem: Codable {
        /// 商品
        var item: Item
        
        /// 数量
        var count: Int
        
        /// 总价
        var price: Int {
            return item.unitPrice * count
        }
    }
    
    /// 多个商品订单集合
    private var lineItems: [LineItem]
    
    /// 日期
    let creationDate: Date = Date()
    
    private var totalPrice: Int {
        return lineItems.map{ $0.price }.reduce(0, +)
        /*
        var totalPrice = 0
        for lineItem in lineItems {
            totalPrice += lineItem.price
        }
        return totalPrice
        */
    }
    
    init(seat: String, itemCounts: [Item: Int]) {
        self.seat = seat
        self.lineItems = itemCounts.compactMap { $1 > 0 ? LineItem(item: $0, count: $1) : nil}
        
        /*
        var lineItems: [LineItem] = []
        for (item, count) in itemCounts {
            let lineItem = LineItem(item: item, count: count)
            lineItems.append(lineItem)
        }
        self.lineItems = lineItems
        */
    }
}































