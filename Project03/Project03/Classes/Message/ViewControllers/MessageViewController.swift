//
//  MessageViewController.swift
//  Project03
//
//  Created by kuroky on 2017/6/15.
//  Copyright © 2017年 Kuroky. All rights reserved.
//

import UIKit

let kMessageSortCellId = "messageSortCellId"

class MessageViewController: MXTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    func setupUI() {
        self.navigationItem.title = "消息"
        self.setupTableView()
    }
    
    func setupTableView() {
        self.tableView.rowHeight = 60
        self.cellIdentifier = kMessageSortCellId
        let nib:UINib! = UINib.init(nibName: "MsgSortListCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: kMessageSortCellId)
        
        self.mx_reloadData { (cell, item) in
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
