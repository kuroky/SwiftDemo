//
//  HttpRequest.swift
//  Project01
//
//  Created by kuroky on 2018/7/26.
//  Copyright © 2018年 kruoky. All rights reserved.
//

import Foundation
import Moya

class HttpRequest {
    class func fetchData<T: TargetType>(Api: T.Type, target: T, cache: Bool = false, cacheHandle: ((Data) -> Void)? = nil, success: @escaping((Data) -> Void), failure: ((Int?, String) -> Void)? ) {
        let provider = MoyaProvider<T>()
        
        provider.request(target) { result in
            switch result {
            case let .success(response):
                success(response.data)
                print("requestUrl: \(String(describing: response.request?.url))")
            case let .failure(error):
                let statusCode = error.response?.statusCode ?? 0
                let message = "请求出错, 错误码:" + String(statusCode)
                failureHandler(failure: failure, stateCode: statusCode, message: error.errorDescription ?? message)
            }
        }
        
        func failureHandler(failure: ((Int?, String) -> Void)?, stateCode: Int?, message: String) {
            if let failureBlack = failure {
                failureBlack(stateCode, message)
            }
        }
    }
}
