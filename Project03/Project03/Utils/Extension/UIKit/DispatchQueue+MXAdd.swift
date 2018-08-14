//
//  DispatchQueue+MXAdd.swift
//  Project03
//
//  Created by kuroky on 2018/8/14.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import Foundation

extension DispatchQueue {
    
    private static var _onceTracker = [String]()
    
    class func once(file: String = #file, function: String = #function, line: Int = #line, closure: () -> Void) {
        let token = file + ":" + function + ":" + String(line)
        once(token: token, closure: closure)
    }
    
    private class func once(token: String, closure: () -> Void) {
        objc_sync_enter(self) ; defer { objc_sync_exit(self) }
        
        if _onceTracker.contains(token) {
            return
        }
        
        _onceTracker.append(token)
        closure()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
