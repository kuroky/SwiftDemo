//
//  UIView+MXAdd.swift
//  Project03
//
//  Created by kuroky on 2018/8/8.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    /// 画圆角
    func mx_drawCorner(viewSize: CGSize, corners: UIRectCorner, radius: Double) {
        let rectBounds = CGRect(x: 0, y: 0, width: viewSize.width, height: viewSize.height)
        let size = CGSize(width: radius, height: radius)
        let bezier = UIBezierPath(roundedRect: rectBounds, byRoundingCorners: corners, cornerRadii: size)
        let maskLayer = CAShapeLayer()
        maskLayer.frame = rectBounds
        maskLayer.path = bezier.cgPath
        self.layer.mask = maskLayer
    }
}
