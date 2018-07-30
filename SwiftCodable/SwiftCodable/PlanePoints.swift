//
//  PlanePoints.swift
//  SwiftCodable
//
//  Created by kuroky on 2018/7/27.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import Foundation

// MARK: -解析未知键
// points 的元素是不确定的，必须按照返回值进行解析
private let json = """
{
    "points": ["KSQL", "KWVI"],
    "KSQL": {
        "code": "KSQL",
        "name": "San Carlos Airport"
    },
    "KWVI": {
        "code": "KWVI",
        "name": "Watsonville Municipla Airport"
    }
}
""".data(using: .utf8)!

struct Route: Decodable {
    struct Airport: Decodable {
        var code: String
        var name: String
    }
    
    var points: [Airport]
    
    // 通过 Int 或 String 初始化的结构来实现
    private struct CodingKeys: CodingKey {
        var stringValue: String
        
        var intValue: Int? {
            return nil
        }
        
        init?(stringValue: String) {
            self.stringValue = stringValue
        }
        
        init?(intValue: Int) {
            return nil
        }
        
        static let points = CodingKeys(stringValue: "points")!
    }
    
    // 根据 .points 对应的代码列表动态解析
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        var points: [Airport] = []
        let codes = try container.decode([String].self, forKey: .points)
        
        for code in codes {
            let key = CodingKeys(stringValue: code)!
            let airport = try container.decode(Airport.self, forKey: key)
            points.append(airport)
        }
        self.points = points
    }
}

// MARK: -解析未确定类型
// type 类型不确定
private let json1 = """
[
    {
        "type": "bird",
        "genus": "Chaetura",
        "species": "Vaux"
    },
    {
        "type": "plane",
        "identifier": "NA12345"
    }
]
""".data(using: .utf8)!
// bird类型
struct Bird: Decodable {
    var genus: String
    var species: String
}

// plane类型
struct Plane1: Decodable {
    var identifier: String
    
}

// 当都有可能的时候，就应该是Either类型
enum Either<T, U> {
    case left(T)
    case right(U)
}

extension Either: Decodable where T: Decodable, U:Decodable {
    init(from decoder: Decoder) throws {
        if let value = try? T(from: decoder) {
            self = .left(value)
        }
        else if let value = try? U(from: decoder) {
            self = .right(value)
        }
        else {
            let context = DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Cannot decode \(T.self) or \(U.self)")
            throw DecodingError.dataCorrupted(context)
        }
    }
}

// MARK: -从多种表示法中解析数据
// 美国
// (价格：美元/加仑)
private let json2 = """
[
    {
        "fuel": "100LL",
        "price": 5.60
    },
    {
        "fuel": "Jet A",
        "price": 4.10
    }
]
""".data(using: .utf8)!

// 加拿大
// (价格：加元/升)
private let json3 = """
{
    "fuels": [
        {
            "type": "100LL",
            "price": 2.54
        },
        {
            "type": "Jet A",
            "price": 3.14,
        },
        {
            "type": "Jet B",
            "price": 3.03
        }
    ]
}
""".data(using: .utf8)!

enum Fuel: String, Decodable {
    case jetA = "Jet A"
    case jetB = "Jet B"
    case oneHundredLowLead = "100LL"
}

struct AmericaFuelPrice: Decodable {
    let fuel: Fuel
    let price: Double
}

struct CanadaFuelPrice: Decodable {
    let type: Fuel
    let price: Double
}

//做完这些之后，问题就被简化成了如何协调两种类型的问题。
//1. 一个解决办法是，先创建一个标准结构，然后通过重载它的初始化方法来定义其他结构
/*
struct FuelPrice {
    let type: Fuel
    let pricePerLiter: Double
    let currency: String
}

extension FuelPrice {
    init(_ other: AmericaFuelPrice) {
        self.type = other.fuel
        self.pricePerLiter = other.price / 3.78541
        self.currency = "USD"
    }
}

extension FuelPrice {
    init(_ other: CanadaFuelPrice) {
        self.type = other.type
        self.pricePerLiter = other.price
        self.currency = "CAD"
    }
}
*/
// 2. 如果你要和一大批不同的数据源打交道，最好还是把 FuelPrice 定义为协议，然后在每个 Decodable 类型的扩展里去实现这个协议：
protocol FuelPrice {
    var type: Fuel { get }
    var pricePerLiter: Double { get }
    var currency: String { get }
}

extension AmericaFuelPrice: FuelPrice {
    var type: Fuel {
        return self.fuel
    }
    
    var pricePerLiter: Double {
        return self.price / 3.78541
    }
    
    var currency: String {
        return "USD"
    }
}

extension CanadaFuelPrice: FuelPrice {
    var pricePerLiter: Double {
        return self.price
    }
    
    var currency: String {
        return "CAD"
    }
}

// MARK: 继承的解析
private let json4 = """
{
    "number": 10,
    "letter": "2.54",
    "mealPreference": "abc"
}
""".data(using: .utf8)!

class EconomySeat: Decodable {
    var number: Int
    var letter: String
}

class PremiumEconomySeat: EconomySeat {
    var mealPreference: String?
    
    private enum CodingKeys: String, CodingKey {
        case mealPreference
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.mealPreference = try container.decode(String.self, forKey: .mealPreference)
        try super.init(from: decoder)
    }
}

class FlightPoints {
    // 未知键
    class func decodeData() {
        LogPrint.decodeStart()
        let decode = JSONDecoder()
        if let point = try? decode.decode(Route.self, from: json) {
            LogPrint.modelDesc(model: point)
        }
        else {
            LogPrint.errorDesc(isDecode: true)
        }
        LogPrint.decodeEnd()
    }
    
    // 不确定类型
    class func decodeData1() {
        LogPrint.decodeStart()
        let decode = JSONDecoder()
        if let objects = try? decode.decode([Either<Bird, Plane1>].self, from: json1) {
            for object in objects {
                switch object {
                case .left(let bird):
                    LogPrint.modelDesc(model: bird)
                case .right(let plane):
                    LogPrint.modelDesc(model: plane)
                }
            }
        }
        else {
            LogPrint.errorDesc(isDecode: true)
        }
        LogPrint.decodeEnd()
    }
    
    // 从多种表示法中解析数据
    class func decodeData2() {
        LogPrint.decodeStart()
        let decode = JSONDecoder()
        if let object = try? decode.decode([AmericaFuelPrice].self, from: json2) {
            LogPrint.modelDesc(model: object)
        }
        else {
            LogPrint.errorDesc(isDecode: true)
        }
        LogPrint.decodeEnd()
        
        LogPrint.decodeStart()
        if let object = try? decode.decode([String: [CanadaFuelPrice]].self, from: json3) {
            LogPrint.modelDesc(model: object)
        }
        else {
            LogPrint.errorDesc(isDecode: true)
        }
        LogPrint.decodeEnd()
    }
    
    class func decodeData3() {
        LogPrint.decodeStart()
        let decode = JSONDecoder()
        if let object = try? decode.decode(PremiumEconomySeat.self, from: json4) {
            LogPrint.modelDesc(model: object)
        }
        else {
            LogPrint.errorDesc(isDecode: true)
        }
        LogPrint.decodeEnd()
    }
}
