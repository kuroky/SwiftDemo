//
//  MXColor.swift
//  Project03
//
//  Created by kuroky on 2018/8/6.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import Foundation
import Hue

extension UIColor {
    /// 16字符串进制转颜色
    class func mx_colorOfHex(hexString: String) -> UIColor {
        if hexString.hasPrefix("#") {
            return UIColor(hex: hexString)
        }
        return UIColor(hex: "#" + hexString)        
    }
}
