//
//  TestAPI.swift
//  Project01
//
//  Created by kuroky on 2018/7/26.
//  Copyright © 2018年 kruoky. All rights reserved.
//

import Foundation
import Moya

// api
enum TestAPI {
    case eventList(limit: Int, offset: Int)
}

extension TestAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://houxuapp.com")!
    }
    
    var path: String {
        switch self {
        case .eventList:
            return "/api/1/events/"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        switch self {
        case let .eventList(limit, offset):
            return .requestParameters(parameters: ["limit": limit, "offset": offset], encoding: URLEncoding.default)
        }
    }
    
    var sampleData: Data {
        switch self {
        case .eventList:
            return "{}".data(using: .utf8)!
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
}
