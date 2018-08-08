//
//  MXTableViewController.swift
//  Project02
//
//  Created by kuroky on 2018/3/5.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import UIKit
import SnapKit
import PullToRefreshKit

class MXTableViewController: MXViewController, UITableViewDataSource, UITableViewDelegate {
    
    public var cellIdentifier: String!
    public var sectionIsSingle: Bool = true

    /// cell统一高度
    public var rowHeight: CGFloat = 50
    
    /// 自定义单个cell高度
    public var cellHeightClosure: ((IndexPath) -> CGFloat)? // 设置cell高度
    
    public var sectionHeaderHeight: CGFloat = 0
    
    /// 自定义header高度
    public var headerHeightClosure: ((Int) -> CGFloat)? // header 高度
    
    public var sectionFooterHeight: CGFloat = 0
    
    /// 自定义footer高度
    public var footerHeightClosure: ((Int) -> CGFloat)? // footer 高度
    
    public var dataList = Array<Any>()
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        return tableView
    } ()
    
    typealias CellClosure = (Any, Any) -> Void  //cell, item
    typealias CellIndexPathClosure = (Any, Any, IndexPath) -> Void  //cell, item, indexPath
    private var configClosure: CellClosure?
    private var configIndexPathClosure: CellIndexPathClosure?
    
    typealias RefreshClosure = () -> Void
    
    public var hideHeaderRefresh: Bool? {
        set {
            guard newValue == false else {
                return
            }
            
            self.tableView.configRefreshHeader(container: self) { [weak self] in
                self?.headRefreshClosure?()
            }
        }
        
        get {
            return false
        }
    }
    private var headRefreshClosure: RefreshClosure?
    
    public var hideFooterRefresh: Bool? {
        set {
            guard newValue == false else {
                return
            }
            
            self.tableView.configRefreshFooter(container: self) { [weak self] in
                self?.footRefreshClosure?()
            }
        }
        
        get {
            return false
        }
    }
    
    private var footRefreshClosure: RefreshClosure?
    
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
        self.view.addSubview(self.tableView)        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension MXTableViewController {
    
    /// TableView 加载数据
    func mx_reloadData(_ closure: @escaping CellClosure) {
        self.configClosure = closure
    }
    
    /// TableView 加载数据 with indexPath
    func mx_reloadIndexPath(_ closure: @escaping CellIndexPathClosure) {
        self.configIndexPathClosure = closure
    }
    
    /// header refresh
    func mx_headRefresh(_ closure: @escaping RefreshClosure) {
        self.headRefreshClosure = closure
    }
    
    /// footer refresh
    func mx_footRefresh(_ closure: @escaping RefreshClosure) {
        self.footRefreshClosure = closure
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
