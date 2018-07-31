//
//  NetworkKit.swift
//  Project01
//
//  Created by kuroky on 2018/7/31.
//  Copyright © 2018年 kruoky. All rights reserved.
//

import Foundation
import Alamofire

enum HttpRequestType {
    case Get
    case Post
}

class NetworkKit {
    
    typealias SuccessHandler = ((Data) -> Void)
    typealias FailHandler = ((Error) -> Void)
    
    private var requestType: HttpRequestType = .Get
    private var url: String?
    private var params: [String: Any]?
    private var success: SuccessHandler?
    private var fail: FailHandler?
    private var request: Request?
}

extension NetworkKit {
    ///设置url
    func url(_ url: String?) -> Self {
        self.url = url
        return self
    }
    
    ///设置Post/Get 默认Get
    func requestType(_ type: HttpRequestType) -> Self {
        self.requestType = type
        return self
    }
    
    ///设置参数
    func params(_ params: [String: Any]?) -> Self {
        self.params = params
        return self
    }
    
    ///成功的回调
    func success(_ handler: @escaping SuccessHandler) -> Self {
        self.success = handler
        return self
    }
    
    ///失败的回调
    func failure(handler: @escaping FailHandler) -> Self {
        self.fail = handler
        return self
    }
}

extension NetworkKit {
    func fetchRequest() -> Void {
        var dataRequest: DataRequest? // alamofire请求后的返回值
        
        if let urlStr = url {
            let method = requestType == .Get ? HTTPMethod.get : HTTPMethod.post
            dataRequest = Alamofire.request(urlStr, method: method, parameters: params)
        }
        
        dataRequest?.responseData(completionHandler: { (response) in
            guard let json = response.data else {
                return
            }
            
            switch response.result {
            case .success:
                self.success?(json)
                
            case let .failure(error):
                self.fail?(error)
            }
        })
    }
    
    func cancelRequest() {
        request?.cancel()
    }
}
