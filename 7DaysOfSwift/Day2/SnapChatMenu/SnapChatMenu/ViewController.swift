//
//  ViewController.swift
//  SnapChatMenu
//
//  Created by kuroky on 2018/4/28.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainScrollView: UIScrollView!
    var centerVC = CenterViewController()
    var leftVC = LeftViewController()
    var rightVC = RightViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupData()
        self.setupUI()
    }
    
    func setupData() {
        
    }
    
    func setupUI() {
        mainScrollView.contentSize = CGSize(width: self.view.frame.size.width * 3, height: 0)
        self.setupViewControllers()
    }
    
    func setupViewControllers() {
        self.mainScrollView.addSubview(leftVC.view)
        leftVC.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        
        self.mainScrollView.addSubview(rightVC.view)
        rightVC.view.frame = CGRect(x: self.view.frame.size.width * 2, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        
        self.mainScrollView.addSubview(centerVC.view)
        centerVC.view.frame = CGRect(x: self.view.frame.size.width, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

