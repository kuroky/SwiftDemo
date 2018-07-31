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
        dataList = ["Moya", "链式", "AFN式"]
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
        if title == "Moya" {
            HttpRequest.fetchData(Api: TestAPI.self, target: .eventList(limit: 1, offset: 0), success: { (json) in
                do {
                    let decode = JSONDecoder()
                    let model = try decode.decode(EventList.self, from: json)
                    print("model: \(model)")
                } catch let error {
                    print("error: \(error)")
                }
            }) { (errorCode, message) in
                print("errprMessage:\(message)")
            }
        } else if title == "链式" {
            NetworkKit().url("https://houxuapp.com/api/1/events/").requestType(.Get).params(["limit": 1, "offset": 0]).success { (json) in
                do {
                    let decode = JSONDecoder()
                    let model = try decode.decode(EventList.self, from: json)
                    print("model: \(model)")
                } catch let error {
                    print("error: \(error)")
                }
                }.failure { (error) in
                    print("errprMessage:\(error.localizedDescription)")
                }.fetchRequest()
            
        } else if title == "AFN式" {
            NetworkTool.fetchData(url: "https://houxuapp.com/api/1/events/", params: ["limit": 1, "offset": 0], success: { (json) in
                do {
                    let decode = JSONDecoder()
                    let model = try decode.decode(EventList.self, from: json)
                    print("model: \(model)")
                } catch let error {
                    print("error: \(error)")
                }
            }) { (error) in
                
            }
        }
    }
}
