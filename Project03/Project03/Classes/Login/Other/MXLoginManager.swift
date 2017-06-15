//
//  MXLoginManager.swift
//  Project03
//
//  Created by kuroky on 2017/6/15.
//  Copyright © 2017年 Kuroky. All rights reserved.
//

import UIKit

class MXLoginManager: NSObject {
    
    var mxIsLogin:Bool?
    
    static let signManager = MXLoginManager()
    
    private override init() {
        super.init()
        self.setup()
    }
    
    func setup() {
        mxIsLogin = false
    }
    
    func mx_Login() {
        mxIsLogin = true
        kMainDelegate.window?.rootViewController = RootViewController()
        //NotificationCenter.default.post(name: NSNotification.Name(rawValue: kLoginStateChanged), object: nil, userInfo: ["state":true])
    }
    
    func mx_Logout() {
        mxIsLogin = false
        kMainDelegate.window?.rootViewController = LoginViewController()
        //NotificationCenter.default.post(name: NSNotification.Name(rawValue: kLoginStateChanged), object: nil, userInfo: ["state":false])
    }
}
