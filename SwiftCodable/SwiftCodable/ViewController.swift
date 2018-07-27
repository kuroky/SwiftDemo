//
//  ViewController.swift
//  SwiftCodable
//
//  Created by kuroky on 2018/5/24.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    var dataList: [Any]!
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupUI()
    }
    
    func setupData() {
        dataList = ["第一次飞行", "等待航线", ["采取控制措施", "解析未知键", "解析未确定类型", "解析随机类型", "从多种表示法中解析数据", "继承的解析"]]
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
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data = dataList[section]
        if data is String {
            return 1
        }
        else if data is [String] {
            let arr = data as! [String]
            return arr.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let data = dataList[indexPath.section]
        var str: String = String(indexPath.section + 1) + "."
        if data is String {
            str = str + " " + (data as! String)
        }
        else if data is [String] {
            let arr = data as! [String]
            str = str + String(indexPath.row + 1) + " " + arr[indexPath.row]
        }
        cell.textLabel?.text = str
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let data = dataList[indexPath.section]
        var title: String = ""
        if data is String {
            title = data as! String
        }
        else if data is [String] {
            let arr = data as! [String]
            title = arr[indexPath.row]
        }
        
        if title == "第一次飞行" {
            let plane = PlaneClass.decodeData()
            PlaneClass.encodeData(dataModel: plane)
        }
        else if title == "等待航线" {            
            let flightPlan = FlightPlanClass.decodeData()
            FlightPlanClass.encodeData(dataModel: flightPlan)
        }
        else if title == "采取控制措施" {
            
        }
        else if title == "解析未知键" {
            FlightPoints.decodeData()
        }
        else if title == "解析未确定类型" {
            FlightPoints.decodeData1()
        }
        else if title == "从多种表示法中解析数据" {
            FlightPoints.decodeData2()
        }
        else if title == "继承的解析" {
            FlightPoints.decodeData3()
        }
    }
}


