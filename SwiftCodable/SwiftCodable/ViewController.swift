//
//  ViewController.swift
//  SwiftCodable
//
//  Created by kuroky on 2018/5/24.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    var dataList: [String]!
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupUI()
    }
    
    func setupData() {
        dataList = ["第一次飞行", "等待航线"]
    }
    
    func setupUI() {
        setupTableView()
    }
    
    func setupTableView() {
        tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 60
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let title = dataList[indexPath.row]
        if title == "第一次飞行" {
            let plane = PlaneClass.decodeData()
            PlaneClass.encodeData(dataModel: plane)
        }
        else if title == "" {
            
        }
    }
}


