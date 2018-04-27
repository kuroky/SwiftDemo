//
//  MXTableViewController.swift
//  Project05
//
//  Created by kuroky on 2018/3/5.
//  Copyright © 2018年 Emucoo. All rights reserved.
//

import UIKit
import SnapKit

class MXTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var dataList:NSMutableArray = []
    var tableView = UITableView.init()
    var cellIdentifier = ""
    var callback: ((_ cell: AnyObject, _ item: AnyObject) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mx_setupUI()
    }
    
    private func mx_setupUI() {
        tableView.frame = self.view.bounds
        self.view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.clear
    }
    
    func mx_reload(closure: @escaping (_ cell: AnyObject, _ item: AnyObject) -> Void) {
        callback = closure
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        callback?(cell, cell)
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
