//
//  NetWorkTool.swift
//  Project01
//
//  Created by kuroky on 2018/7/31.
//  Copyright © 2018年 kruoky. All rights reserved.
//

import Foundation
import Alamofire

enum MethodType {
    case Get
    case Post
}

class NetworkTool {
    
    class func fetchData(_ type: MethodType = .Get, url: String, params: [String: Any]?, success: @escaping (_ data: Data) -> (), failure: ((_ error: Error?) -> Void)?) {
        let method = type == .Get ? HTTPMethod.get : HTTPMethod.post
        
        Alamofire.request(url, method: method, parameters: params).responseData { (response) in
            guard let json = response.data else {
                return
            }
            
            switch response.result {
            case .success:
                success(json)
            case let .failure(error):
                failure?(error)
            }
        }
    }
}
