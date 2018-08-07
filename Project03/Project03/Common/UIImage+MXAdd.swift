//
//  UIImage+MXImage.swift
//  Project03
//
//  Created by kuroky on 2018/8/6.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    /// 生成原图 (TabBarItem、UIBarButtonItem)
    class func originalImage(name: String) -> UIImage {
        guard let image = UIImage(named: name) else {
            return UIImage.init()
        }
        return image.withRenderingMode(.alwaysOriginal)
    }
}
