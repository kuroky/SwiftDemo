//
//  UINavigationBar+MXAdd.swift
//  Project03
//
//  Created by kuroky on 2018/8/7.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import Foundation
import UIKit

// https://medium.com/@BeauNouvelle/adding-a-closure-to-uibarbuttonitem-24dfc217fe72

typealias UIBarButtonItemTargetClosure = (UIBarButtonItem) -> ()

class UIBarButtonItemTargetWrapper: NSObject {
    let closure: UIBarButtonItemTargetClosure?
    init(_ closure: @escaping UIBarButtonItemTargetClosure) {
        self.closure = closure
    }
}

extension UIBarButtonItem {
    
    private struct AssociatedKeys {
        static var targetClosure = "targetClosure"
    }
    
    private var targetClosure: UIBarButtonItemTargetClosure? {
        get {
            guard let closureWrapper = objc_getAssociatedObject(self, &AssociatedKeys.targetClosure) as? UIBarButtonItemTargetWrapper else {
                return nil
            }

            return closureWrapper.closure
        }

        set(newValue) {
            guard let newValue = newValue else {
                return
            }
            objc_setAssociatedObject(self, &AssociatedKeys.targetClosure, UIBarButtonItemTargetWrapper(newValue), objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /// 根据img图片初始化UIBarButtonItem
    convenience init(imgName: String, closure: @escaping UIBarButtonItemTargetClosure) {
        self.init(image: UIImage.originalImage(name: imgName), style: .plain, target: nil, action: nil)
        targetClosure = closure
        action = #selector(UIBarButtonItem.closureAction)
    }
    
    @objc func closureAction() {
        guard let targetClosure = targetClosure else { return }
        targetClosure(self)
    }
}
















