//
//  MessageViewController.swift
//  Project03
//
//  Created by kuroky on 2017/6/15.
//  Copyright © 2017年 Kuroky. All rights reserved.
//

import UIKit

class MessageViewController: MXTableViewController {
    
    let kMessageSortCellId = "messageSortCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupData()
        self.setupUI()
        self.fetchData()
    }
    
    func setupData() {
          
    }
    
    func setupUI() {
        self.navigationItem.title = "消息"
        self.setupTableView()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(imgName: "barbuttonicon_add", closure: { _ in
            
        })
    }
    
    func setupTableView() {
        self.rowHeight = 65
        self.cellIdentifier = kMessageSortCellId
        let nib:UINib! = UINib.init(nibName: "MsgSortListCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: kMessageSortCellId)
        
        self.mx_reloadData { (cell, item) in
            (cell as! MsgSortListCell).configMsgItem(msgItem: (item as! MsgListItem))
        }
    }
    
    func fetchData() {
        guard let json = Data.dataFromJsonFile(fileName: "message") else { return }
        
        let decoder = JSONDecoder()
        guard let msgList = try? decoder.decode(MsgListData.self, from: json) else { return }
        
        guard msgList.data != nil else { return }
        
        self.dataList.append(contentsOf: msgList.data!)
        
        self.tableView.reloadData()
    }
    
    //MARK:- UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
