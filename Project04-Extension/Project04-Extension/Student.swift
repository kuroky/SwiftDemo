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
}

extension Student {
    func printCurrentStudentName() {
        print(self.name)
    }
}

