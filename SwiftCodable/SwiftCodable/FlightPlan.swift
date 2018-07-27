//
//  FlightPlan.swift
//  SwiftCodable
//
//  Created by kuroky on 2018/7/27.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import Foundation

private let json = """
{
    "aircraft": {
        "identification": "NA12345",
        "color": "Blue/White"
    },
    "route": ["KTTD", "KHIO"],
    "departure_time": {
        "proposed": "2018-04-20T14:14:00-0700",
        "actual": "2018-04-20T14:20:00-0700"
    },
    "flight_rules": "IFR",
    "remarks": null
}
""".data(using: .utf8)!

struct FlightPlan: Codable {
    var aircraft: Aircraft      // 飞机类型
    var flightRules: FlightRules    // 飞行规则 只有几种，所以使用枚举
    var route: [String]     // 途径点
    
    private var departureDates: [String: Date] // 定义成private 隐藏实现细节
    var proposeDepartureDate: Date? {
        return departureDates["proposed"]
    }

    var actualDepartureDate: Date? {
        return departureDates["actual"]
    }

    var remarks: String? // Optional
}

extension FlightPlan {
    private enum CodingKeys: String, CodingKey {
        case aircraft
        case flightRules = "flight_rules" // 字段映射
        case route
        case departureDates = "departure_time" // 字段映射
        case remarks
    }
}

struct Aircraft: Codable {
    var identification: String
    var color: String
}

enum FlightRules: String, Codable {
    case visual = "VFR"
    case instrument = "IFR"
}

class FlightPlanClass {
    
    class func decodeData() -> FlightPlan {
        LogPrint.decodeStart()
        let decode = JSONDecoder()
        // snake_case（蛇形命名法)转成snakeCase (驼峰命名法)
        //decode.keyDecodingStrategy = .convertFromSnakeCase
        // 日期格式
        decode.dateDecodingStrategy = .iso8601
        let plane = try! decode.decode(FlightPlan.self, from: json)
        LogPrint.modelDesc(model: plane)
        LogPrint.decodeEnd()
        return plane
        
        /*
        if let plane = try? decode.decode(FlightPlan.self, from: json) {
            LogPrint.modelDesc(model: plane)
            LogPrint.decodeEnd()
            return plane
        }
        else {
            LogPrint.errorDesc(isDecode: true)
            
         
            let aircraft = Aircraft(identification: "", color: "")
            let rules = FlightRules.visual
            let route = ["1", "2"]
            let proposeDepartureDate = Date(timeIntervalSince1970: 12)
            let actualDepartureDate = Date(timeIntervalSince1970: 12)
            let dates = ["proposed": proposeDepartureDate, "actual": actualDepartureDate]
            let remark = ""
            
            let plan = FlightPlan(aircraft: aircraft, flightRules: rules, route: route, departureDates: dates, remarks: remark)
            return FlightPlan(aircraft: aircraft, flightRules: rules, route: route, departureDates: dates, remarks: remark)
 
        }
         */
    }
    
    class func encodeData(dataModel: FlightPlan) {
        LogPrint.encodeStart()
        let encode = JSONEncoder()
        encode.outputFormatting = .prettyPrinted
        if let json = try? encode.encode(dataModel) {
            LogPrint.modelDesc(model: String(data: json, encoding: .utf8)!)
        }
        else {
            LogPrint.errorDesc(isDecode: false)
        }
        LogPrint.encodeEnd()
    }
}
