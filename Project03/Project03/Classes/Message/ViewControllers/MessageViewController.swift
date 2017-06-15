//
//  MessageViewController.swift
//  Project03
//
//  Created by kuroky on 2017/6/15.
//  Copyright © 2017年 Kuroky. All rights reserved.
//

import UIKit

let kMessageSortCellId = "messageSortCellId"

class MessageViewController: MXViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
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
        let nib:UINib! = UINib.init(nibName: "MsgSortListCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: kMessageSortCellId)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MsgSortListCell = tableView.dequeueReusableCell(withIdentifier: kMessageSortCellId, for: indexPath) as! MsgSortListCell
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
