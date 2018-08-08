//
//  UILabel+MXAdd.swift
//  Project03
//
//  Created by kuroky on 2018/8/8.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import Foundation
import UIKit

class MXLabel: UILabel {
    
    @IBInspectable var previewBgColor: UIColor {
        set(newValue) {
            super.backgroundColor = newValue
        }
        
        get {
            return super.backgroundColor ?? UIColor.clear
        }
    }
}
