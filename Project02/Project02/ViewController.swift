//
//  ViewController.swift
//  Project02
//
//  Created by kuroky on 2017/6/14.
//  Copyright © 2017年 Kuroky. All rights reserved.
//

import UIKit
import PullToRefreshKit

private let kTableViewCellId: String = "kTableViewCell"

class ViewController: MXTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupData()
        self.setupUI()
    }
    
    func setupData() {
        self.dataList = Array.init(repeating: DetailItem(title: "title", content: "content"), count: 20)
    }
    
    func setupUI() {
        self.navigationItem.title = "list"
        self.setupTableView()
    }
    
    func setupTableView() {
        self.rowHeight = 100
        self.cellIdentifier = kTableViewCellId
        
        let nib = UINib.init(nibName: "DetailCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: kTableViewCellId)
        
        self.tableView.snp.makeConstraints { (make) in
            make.leading.equalTo(self.view.snp.leading)
            make.trailing.equalTo(self.view.snp.trailing)
            make.top.equalTo(self.view.snp.top)
            make.bottom.equalTo(self.view.snp.bottom)
        }
        
        //self.hideHeaderRefresh = false
        self.hideFooterRefresh = false
        
        self.mx_reloadData { (cell, item) in
            (cell as! DetailCell).configCellItem(item as! DetailItem)
        }
        
        self.mx_headRefresh {
            self.tableView.switchRefreshHeader(to: .normal(.success, 0))
        }
        
        self.mx_footRefresh {
            self.tableView.switchRefreshFooter(to: .normal)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
        let detailVC:SubViewController = SubViewController()
        let item = self.dataList[indexPath.row]
        detailVC.detailItem = item as! DetailItem
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
