//
//  MXTableViewController.swift
//  Project02
//
//  Created by kuroky on 2018/3/5.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import UIKit
import SnapKit

class MXTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    public var dataList:NSMutableArray = []
    public var tableView = UITableView.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mx_setupUI()
    }
    
    func mx_setupUI() {
        self.view.addSubview(tableView)
        tableView.rowHeight = 100
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
