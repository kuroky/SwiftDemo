//
//  ViewController.swift
//  Project02
//
//  Created by kuroky on 2017/6/14.
//  Copyright © 2017年 Kuroky. All rights reserved.
//

import UIKit
import PullToRefreshKit

let kTableViewCellId:String = "kTableViewCell"

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    /// 数据源
    var dataList:NSMutableArray = []
    var tableView = UITableView.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupData()
        self.setupUI()
    }
    
    func setupData() {
        self.dataList = NSMutableArray.init()
        for i in 0..<20 {
            let item = DetailItem.init()
            item.title = String(i)
            item.content = String(i + 20)
            self.dataList.add(item)
        }
    }
    
    func setupUI() {
        self.navigationItem.title = "list"
        
        self.tableView.frame = self.view.bounds
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.rowHeight = 120
        self.view.addSubview(self.tableView)
        let nib = UINib.init(nibName: "DetailCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: kTableViewCellId)
        
        let header = DefaultRefreshHeader.header()
        self.tableView.configRefreshHeader(with: header) {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(1 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: {
                self.tableView.switchRefreshHeader(to: .normal(.success, 0))
            })
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:DetailCell = tableView.dequeueReusableCell(withIdentifier: kTableViewCellId, for: indexPath) as! DetailCell
        let item = self.dataList[indexPath.row]
        cell .configCellItem(item as! DetailItem)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
        let detailVC:SubViewController = SubViewController.init(nibName: "SubViewController", bundle: nil)
        let item = self.dataList[indexPath.row]
        detailVC.detailItem = item as! DetailItem
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

