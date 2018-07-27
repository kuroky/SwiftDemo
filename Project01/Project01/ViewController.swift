//
//  ViewController.swift
//  Project01
//
//  Created by Kuroky on 2017/6/8.
//  Copyright © 2017年 kruoky. All rights reserved.
//

import UIKit
import SnapKit
import Moya

class ViewController: UIViewController {
    
    var tableView: UITableView!
    var dataList: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
    }
    
    func setupUI() {
        self.navigationItem.title = "Http Request Test";
        self.view.backgroundColor = UIColor.lightGray
        setupTableView()
    }
    
    func setupData() {
        dataList = ["1", "2", "3"]
    }
    
    func setupTableView() {
        tableView = UITableView(frame: CGRect.zero, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 60
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.leading.equalTo(self.view.snp.leading)
            make.trailing.equalTo(self.view.snp.trailing)
            make.top.equalTo(self.view.snp.top)
            make.bottom.equalTo(self.view.snp.bottom)
        }
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "tableViewCell")
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
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath)
        cell.textLabel?.text = String(dataList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let title = dataList[indexPath.row]
        if title == "1" {
            HttpRequest.fetchData(Api: TestAPI.self, target: .eventList, success: { (json) in
                
            }) { (errorCode, message) in
                print("errprMessage:\(message)")
            }
        }
        else if title == "2" {
            let json = """
{
    "manufacturer": "Cessna",
    "model": "172 Skyhawk",
    "seats": 4,
}
""".data(using: .utf8)!
            
            let decoder = JSONDecoder()
            let plane = try! decoder.decode(TestModel.self, from: json)
            print(plane.manufacturer + " " + plane.model + "" + String(plane.seats))

        }
    }
}
