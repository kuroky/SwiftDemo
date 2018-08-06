//
//  ViewController.swift
//  Project04-Extension
//
//  Created by kuroky on 2017/9/4.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

import UIKit
import SnapKit

let kTableViewCellid = "tableViewCellid"


class ViewController: MXTableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupData()
        self.setupUI()
    }
    
    func setupData() {
        self.dataList = ["添加计算型实例属性和计算型类型类型属性",
                         "定义实例方法和类型方法",
                         "提供新的构造器",
                         "定义下标",
                         "定义和使用新的嵌套类型",
                         "使已存在类型的遵守某个协议"]
    }
    
    func setupUI() {
        self.navigationItem.title = "Swift-Extension"
        self.rowHeight = 100
        self.cellIdentifier = kTableViewCellid
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.leading.equalTo(self.view.snp.leading)
            make.trailing.equalTo(self.view.snp.trailing)
            make.top.equalTo(self.view.snp.top)
            make.bottom.equalTo(self.view.snp.bottom)
        }
        
        self.tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: kTableViewCellid)
        
        self.mx_reloadData { (cell, item) in
            (cell as! UITableViewCell).textLabel?.text = (item as! String)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let title = self.dataList[indexPath.row] as! String
        let detailVC = DetailViewController.init()
        detailVC.navigationItem.title = title
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
