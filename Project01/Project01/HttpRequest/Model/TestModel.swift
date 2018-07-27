//
//  TestModel.swift
//  Project01
//
//  Created by kuroky on 2018/7/26.
//  Copyright © 2018年 kruoky. All rights reserved.
//

import Foundation

struct TestModel: Codable {
    
    var manufacturer: String
    var model: String
    var seats: Int
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.manufacturer = try container.decode(String.self, forKey: .manufacturer)
        self.model = try container.decode(String.self, forKey: .model)
        self.seats = try container.decode(Int.self, forKey: .seats)
    }
    
    private enum CodingKeys: String, CodingKey {
        case manufacturer
        case model
        case seats
    }
}

let json = """
{
    "manufacturer": "Cessna",
    "model": "172 Skyhawk",
    "seats": 4,
}
""".data(using: .utf8)!

let decoder = JSONDecoder()
let plane = try! decoder.decode(TestModel.self, from: json)



















