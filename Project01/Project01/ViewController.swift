//
//  ViewController.swift
//  Project01
//
//  Created by Kuroky on 2017/6/8.
//  Copyright © 2017年 kruoky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        self.navigationItem.title = "title";
        
        let btn = UIButton.init(type: .custom)
        btn.frame = CGRect(x:100, y:100, width:200, height:38)
        self.view.addSubview(btn)
        btn.backgroundColor = UIColor.blue
        btn .addTarget(self, action:#selector(clickBtn(button:)), for:.touchUpInside)
        
        let button = UIButton.init(frame:CGRect(x:100, y:200, width:200, height:38))
        button.backgroundColor = UIColor.yellow
        self.view.addSubview(button)
        button.addTarget(self, action:#selector(clickButton), for:.touchUpInside)
    }
    
    func clickBtn(button:UIButton) -> String {
        print("click")
        return "123"
    }
    func clickButton() {
        let detailVC = SubViewController.init()
        detailVC.view.backgroundColor = UIColor.white;
        self.navigationController?.pushViewController(detailVC, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

