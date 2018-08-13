//
//  NSData+MXAdd.swift
//  Project03
//
//  Created by kuroky on 2018/8/7.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import Foundation

extension Data {
    
    /// 从Bundle获取json文件
    static func dataFromJsonFile(fileName: String) -> Data? {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "json") else {
            
            return nil
        }
        
        let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: NSData.ReadingOptions.mappedIfSafe)
        return data
    }
}
