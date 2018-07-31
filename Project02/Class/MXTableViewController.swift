//
//  MXTableViewController.swift
//  Project02
//
//  Created by kuroky on 2018/3/5.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import UIKit
import SnapKit

class MXTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    public var cellIdentifier: String!
    public var sectionIsSingle: Bool = true

    public var rowHeight: CGFloat = 50
    public var cellHeightClosure: ((IndexPath) -> CGFloat)? // 设置cell高度
    
    public var sectionHeaderHeight: CGFloat = 0
    public var headerHeightClosure: ((Int) -> CGFloat)? // header 高度
    
    public var sectionFooterHeight: CGFloat = 0
    public var footerHeightClosure: ((Int) -> CGFloat)? // footer 高度
    
    public var dataList: [Any]!
    public var tableView: UITableView!
    
    typealias CellClosure = (Any, Any) -> Void  //cell, item
    typealias CellIndexPathClosure = (Any, Any, IndexPath) -> Void  //cell, item, indexPath
    private var configClosure: CellClosure?
    private var configIndexPathClosure: CellIndexPathClosure?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mx_setupData()
        mx_setupUI()
    }
    
    private func mx_setupData() {
        self.dataList = [Any]()
    }
    
    private func mx_setupUI() {
        self.view.backgroundColor = UIColor.white
        self.mx_setupTableView()
    }
    
    private func mx_setupTableView() {
        self.tableView = UITableView(frame: self.view.bounds, style: .plain)
        self.view.addSubview(self.tableView)
    
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension MXTableViewController {
    func mx_reloadData(_ closure: @escaping CellClosure) {
        self.configClosure = closure
    }
    
    func mx_reloadIndexPath(_ closure: @escaping CellIndexPathClosure) {
        self.configIndexPathClosure = closure
    }
}

extension MXTableViewController {
    
    //MARK:- UITableViewDelegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sectionIsSingle ? 1 : self.dataList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.sectionIsSingle {
            return self.dataList.count
        } else {
            let items = self.dataList[section]
            return items is [Any] ? (items as! [Any]).count : 1
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard self.cellHeightClosure != nil else {
            return self.rowHeight
        }
        return self.cellHeightClosure!(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard self.headerHeightClosure != nil else {
            return self.sectionHeaderHeight
        }
        return self.headerHeightClosure!(section)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        guard self.footerHeightClosure != nil else {
            return self.sectionFooterHeight
        }
        return self.footerHeightClosure!(section)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        let item = self.itemAtIndexPath(indexPath: indexPath)
        if self.configClosure != nil {
            self.configClosure!(cell, item)
        } else if self.configIndexPathClosure != nil {
            self.configIndexPathClosure!(cell, item, indexPath)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        tableView.cellLayoutMarginsFollowReadableWidth = false        
    }
    
    func itemAtIndexPath(indexPath: IndexPath) -> Any {
        if self.sectionIsSingle {
            return self.dataList[indexPath.row]
        } else {
            let item = self.dataList[indexPath.section]
            if item is [Any] {
                return (item as! [Any])[indexPath.row]
            }
            return item
        }
    }
    
    //MARK:- UITableViewDataSource
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
    }
}
