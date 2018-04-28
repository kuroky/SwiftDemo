//
//  ViewController.swift
//  PullRefresh
//
//  Created by kuroky on 2018/4/28.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import UIKit

let CellId  =   "cellId"
class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var dataList:[String]!
    var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupData()
        self.setupUI()
    }
    
    func setupData() {
        dataList = ["1", "2", "3", "4", "5"];
    }
    
    func setupUI() {
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: CellId)
        self.tableView.rowHeight = 60
        self.refreshControl.addTarget(self, action: #selector(refreshDidTap), for: UIControlEvents.valueChanged)
        self.tableView.refreshControl = self.refreshControl
    }

    @objc func refreshDidTap() {
        let attributes:[NSAttributedStringKey: Any] = [kCTForegroundColorAttributeName as NSAttributedStringKey: UIColor.black]
        self.refreshControl.attributedTitle = NSAttributedString(string: "Last updated on \(Date())", attributes: attributes)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            self.dataList.append("1235")
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellId, for: indexPath)
        let str = self.dataList[indexPath.item]
        cell.textLabel?.text = str
        return cell
    }
}



