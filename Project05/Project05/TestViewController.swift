//
//  TestViewController.swift
//  Project05
//
//  Created by kuroky on 2018/3/5.
//  Copyright © 2018年 Emucoo. All rights reserved.
//

import UIKit

class TestViewController: MXTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupData()
        self.setupUI()
    }
    
    func setupData() {
        cellIdentifier = "testCellId"
        dataList = ["", "", "", "", ""]
    }
    
    func setupUI() {
        tableView.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(self.view).inset(UIEdgeInsets.zero)
        }
        
        self.view.backgroundColor = UIColor.white
        tableView.register(UINib.init(nibName: "TestCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        
//        self.mx_reload { (cell: TestCell, item: AnyObject) in
//            //print("12")
//            cell.configCellItem(item)
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
