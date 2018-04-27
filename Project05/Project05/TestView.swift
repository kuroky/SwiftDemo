//
//  TestView.swift
//  Project05
//
//  Created by kuroky on 2018/3/7.
//  Copyright © 2018年 Emucoo. All rights reserved.
//

import UIKit

class TestView: NSObject {

    let fav = FinisnAlerView()
    var counter = PressCountr()
    
}

class FinisnAlerView {
    var buttons: [String] = ["cancel", "The next"]
    var buttonPressed: ((Int) -> Void)?
    
    func goToTheNext() {
        buttonPressed?(1)
    }
}

struct PressCountr {
    var count = 0
    
    mutating func buttonPressed(at Index: Int) {
        self.count += 1
    }
    
}
