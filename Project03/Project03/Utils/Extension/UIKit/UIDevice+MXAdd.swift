//
//  UIDevice+MXAdd.swift
//  Project03
//
//  Created by kuroky on 2018/8/14.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import Foundation
import UIKit

extension UIDevice {
        
    /// 当前设备宽度
    static var mx_deviceWidth: CGFloat {
        var width: CGFloat = 0
        DispatchQueue.once {
            width = UIScreen.main.bounds.size.width
        }
        return width
    }
    
    /// 当前设备高度
    static var mx_deviceHeight: CGFloat {
        var height: CGFloat = 0
        DispatchQueue.once {
            height = UIScreen.main.bounds.size.height
        }
        return height
    }
}
