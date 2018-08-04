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

class ViewController: MXTableViewController {
    
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
        self.dataList = ["Moya", "链式", "AFN式"]
    }
    
    func setupTableView() {
        self.rowHeight = 60;
        self.cellIdentifier = "cellId"
        self.view.addSubview(self.tableView)
        tableView.snp.makeConstraints { (make) in
            make.leading.equalTo(self.view.snp.leading)
            make.trailing.equalTo(self.view.snp.trailing)
            make.top.equalTo(self.view.snp.top)
            make.bottom.equalTo(self.view.snp.bottom)
        }
        self.tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "tableViewCell")
        
        self.mx_reloadData { (cell, item) in
            (cell as! UITableViewCell).textLabel?.text = item as? String
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let title = self.dataList[indexPath.row] as? String
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
