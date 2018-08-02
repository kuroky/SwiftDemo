//
//  ViewController.swift
//  Project04-Extension
//
//  Created by kuroky on 2017/9/4.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

import UIKit

let kTableViewCellid = "tableViewCellid"


class ViewController: UIViewController {
    
    var tableView: UITableView!
    var dataList = [String]()
    
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
        self.tableView = UITableView.init(frame: self.view.bounds, style: .plain)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.rowHeight = 100
        self.view.addSubview(self.tableView)
        
        self.tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: kTableViewCellid)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kTableViewCellid, for: indexPath)
        cell.textLabel?.text = self.dataList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let title = self.dataList[indexPath.row]
        let detailVC = DetailViewController.init()
        detailVC.navigationItem.title = title
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
