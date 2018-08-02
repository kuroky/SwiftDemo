//
//  Student.swift
//  Project04-Extension
//
//  Created by kuroky on 2017/9/4.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

import UIKit

class Student: NSObject {
    var name = ""
    var age = 1
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

// 定义实例方法和类型方法
extension Student {
    func printCurrentStudentName() {
        print(self.name)
    }
}

