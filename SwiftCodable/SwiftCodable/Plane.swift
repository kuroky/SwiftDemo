//
//  Plane.swift
//  SwiftCodable
//
//  Created by kuroky on 2018/5/24.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import Foundation

// 1. 遵循Decodable协议 解码
/*
struct Plane: Decodable {
    var manufacture: String
    var model: String
    var seats: Int
    
    private enum CodingKeys: String, CodingKey {
        case manufacture
        case model
        case seats
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.manufacture = try container.decode(String.self, forKey: .manufacture)
        self.model = try container.decode(String.self, forKey: .model)
        self.seats = try container.decode(Int.self, forKey: .seats)
    }
}
*/

// 2. 遵循 Encodable 解码 Codable 是组合类型只需要遵循Codable即可
/*
struct Plane: Codable {
    var manufacture: String
    var model: String
    var seats: Int
    
    private enum CodingKeys: String, CodingKey {
        case manufacture
        case model
        case seats
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.manufacture = try container.decode(String.self, forKey: .manufacture)
        self.model = try container.decode(String.self, forKey: .model)
        self.seats = try container.decode(Int.self, forKey: .seats)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.manufacture, forKey: .manufacture)
        try container.encode(self.model, forKey: .model)
        try container.encode(self.seats, forKey: .seats)
    }
}
*/

// 3. 移除冗余的代码
struct Plane: Codable {
    var manufacture: String
    var model: String
    var seats: Int
}


let json = """
{
    "manufacture": "Cessna",
    "model": "172 Skyhawk",
    "seats": 4,
}
""".data(using: .utf8)!

class PlaneClass {
    class func decodeData() -> Plane {
        print("==========  decode start  ===========")
        let decoder = JSONDecoder()
        if let plane = try? decoder.decode(Plane.self, from: json) {
            print(plane.manufacture)
            
            print(plane.model)
            
            print(plane.seats)
            print("==========  decode end   ============")
            return plane
        }
        else {
            return Plane(manufacture: "Cessna", model: "172 Skyhawk", seats: 4)
        }
    }
    
    class func encodeData(dataModel: Plane) {
        print("==========  encode start  ===========")
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        if let codeJson = try? encoder.encode(dataModel) {
            print("json: \(String(data: codeJson, encoding: .utf8)!)")
        }
        else {
            print("error")
        }
        print("=========   decode end  =============")
    }
}
















