//
//  DetailViewController.swift
//  Project04-Extension
//
//  Created by kuroky on 2017/9/4.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var descLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }

    func setupUI() {
        self.view.backgroundColor = UIColor.white
        let title = self.navigationItem.title
        
        if title == "添加计算型实例属性和计算型类型类型属性" {
            self.descLabel.text = "什么是计算型属性，计算型属性(computed property)不直接存储值，而是提供一个getter和一个可选的setter，来间接获取和设置其他属性或变量的值"
            let width = self.view.width
            print("viewWidth: ", width)
        }
        else if title == "定义实例方法和类型方法" {
            self.descLabel.text = "在Swift中，Extension可以给类和类型添加，比如你也可以给一个struct添加Extension，而在Objective-C中，你只能给类添加Extension。"
            let jack = Student()
            jack.name = "jack";
            jack.printCurrentStudentName()
        }
        else if title == "提供新的构造器" {
            self.descLabel.text = "最常见的Rect通常由origin和size来构造初始化，但是如果在你写完Rect的定义后，你偏偏想要通过center和size来确定Rect(作为一个程序员就要有一种作死的精神)，那你就要用Extension来给Rect提供一个新的构造器。"
            let rect = Rect(center: Point(x: 175, y: 300),
                            size: Size(width: 200, height: 300))
            print("rect", rect)
        }
        else if title == "定义下标" {
            self.descLabel.text = "通过Swift中的Extension，你可以给已知类型添加下标。例如下面的例子就是给Int类型添加一个下标，该下标表示十进制数从右向左的第n个数字"
            print("test: 4567892", 4567892[4])
        }
        else if title == "定义和使用新的嵌套类型" {
            self.descLabel.text = "Extension可以给已知的类、结构体、枚举添加嵌套类型。下面的例子是给Int类型添加一个判读正负数的Extension，该Extension嵌套一个枚举"
            print("test [3, 19, -27, 0, -6, 0, 7]")
            printIntegerKinds([3, 19, -27, 0, -6, 0, 7])
        }
        else if title == "使已存在类型的遵守某个协议" {
            self.descLabel.text = "Extension可以为一个已有的类、结构体、枚举类型或者协议类型添加新功能。\n\n可以在没有权限获取原始源代码的情况下扩展类型的内容。\n\nExtendion和Objective-C中的Category类似。(OC中的Category有名字，Swift中的扩展没有名字)。"
            let tom = Employee()
            print("test: ", tom.address)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

