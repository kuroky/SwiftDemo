//
//  ViewController.swift
//  CustomFont
//
//  Created by kuroky on 2018/4/27.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let FontCellId  =   "FontCellId"
    let fontNames:[String] = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular", "Gaspar Regular"]
    let dataList:[String] = ["30 Days Swift", "这些字体特别适合打「奋斗」和「理想」", "谢谢「造字工房」，本案例不涉及商业使用", "使用到造字工房劲黑体，致黑体，童心体", "呵呵，再见🤗 See you next Project", "微博 @Allen朝辉",
                             "测试测试测试测试测试测试",
                             "123",
                             "Alex",
                             "@@@@@@"]
    var fontIndex = 0
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupData()
        self.setupUI()
    }

    func setupData() {
        
    }
    
    func setupUI() {
        self.navigationItem.title = "Font Change"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: FontCellId)
        tableView.rowHeight = 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FontCellId, for: indexPath)
        cell.textLabel?.text = dataList[indexPath.row]
        cell.textLabel?.font = UIFont.init(name: fontNames[fontIndex], size: 15)
        return cell
    }
    
    @IBAction func clickChangeButton(_ sender: UIButton) {
        fontIndex = Int(arc4random_uniform(UInt32(fontNames.count)))
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

