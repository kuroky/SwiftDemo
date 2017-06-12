//
//  SubViewController.swift
//  Project01
//
//  Created by Kuroky on 2017/6/9.
//  Copyright © 2017年 kruoky. All rights reserved.
//

import UIKit

let kSubViewControllerCellId:String   =   "subViewControllerCellId"

class SubViewController: FFBaseViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var subItems:NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupData()
        self.setupUI()
    }

    func setupData() {
        self.subItems = NSMutableArray.init()
        self.subItems.addObjects(from: ["1", "2", "3", "4", "5"])
    }
    
    func setupUI() {
        self.view.backgroundColor = UIColor.lightGray
        self.tableView.backgroundColor = UIColor.clear
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: kSubViewControllerCellId)
        self.tableView.rowHeight = 100;
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.subItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kSubViewControllerCellId, for: indexPath)
        cell.backgroundColor = UIColor.clear
        if indexPath.row < self.subItems.count {
            cell.textLabel?.text = self.subItems[indexPath.row] as? String
        }
        return cell;
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath.row)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
