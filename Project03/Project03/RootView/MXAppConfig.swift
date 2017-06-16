//
//  MXAppConfig.swift
//  Project03
//
//  Created by kuroky on 2017/6/15.
//  Copyright © 2017年 Kuroky. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class MXAppConfig: NSObject {
    
    class func mx_setup() {
        //IQKeyboardManager.sharedManager().enable = true
        IQKeyboardManager.sharedManager().shouldResignOnTouchOutside = true
    }
}
