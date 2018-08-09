//
//  ContactsViewController.swift
//  Project03
//
//  Created by kuroky on 2018/8/6.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import UIKit

class ContactsViewController: MXTableViewController {
    
    let cellId  =   "contactsCellId"
    var sortedKeys: [String] = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupData()
        self.setupUI()
        self.fetchData()
    }
    
    func setupData() {
        
    }
    
    func setupUI() {
        self.navigationItem.title = "通讯录"
        self.setupTableView()
    }
    
    func setupTableView() {
        self.sectionIsSingle = false
        self.rowHeight = 54
        self.tableView.sectionIndexColor = UIColor.darkGray
        self.cellIdentifier = cellId
        self.tableView.register(UINib(nibName: "ContactsCell", bundle: nil), forCellReuseIdentifier: cellId)
        
        self.mx_reloadData { (cell, item) in
            (cell as! ContactsCell).configContacts(contact: (item as! ContactsItem))
        }
        
        self.headerHeightClosure = { section in
            return section == 0 ? 0 : 20
        }
    }
    
    func fetchData() {
        let decoder = JSONDecoder()
        // 顶部数据
        let topJson = try? decoder.decode([ContactsItem].self, from: topContactsJson)
        self.dataList.append(topJson!)
        self.sortedKeys.append("")
        
        guard let json = Data.dataFromJsonFile(fileName: "contact") else { return }
        
        guard let contacts = try? decoder.decode(ContactsData.self, from: json) else { return }
        
        guard contacts.data != nil else { return }
        
        // 星标lianxiren
        let starContacts = contacts.data?.first
        self.dataList.append(starContacts!)
        self.sortedKeys.append("★")
        
        let otherContacts = contacts.data?.last
        let sortResult = self.sortedContacts(tempList: otherContacts!)
        self.dataList.append(contentsOf: sortResult.sortValues)
        self.sortedKeys.append(contentsOf: sortResult.sortKeys)
        
        self.tableView.reloadData()
    }
    
    func sortedContacts(tempList: Array<ContactsItem>) -> (sortKeys: [String], sortValues: [[ContactsItem]]) {
        var dataSource = Dictionary<String, Array<ContactsItem>>()
        for index in 0..<tempList.count {
            let contactModel = tempList[index]
            guard let nameSpell = contactModel.nameSpell else { continue }
            let lowerBound = String.Index(encodedOffset: 0)
            let upperBound = String.Index(encodedOffset: 1)
            let firstLettery = nameSpell[lowerBound..<upperBound].uppercased()
            if var letterArray = dataSource[firstLettery] {
                letterArray.append(contactModel)
                dataSource[firstLettery] = letterArray
            } else {
                var tempArray = [ContactsItem]()
                tempArray.append(contactModel)
                dataSource[firstLettery] = tempArray
            }
        }
        
        let sortedKeys = Array(dataSource.keys).sorted(by: <)
        var soredValues = [[ContactsItem]]()
        for key in sortedKeys {
            let value = dataSource[key]
            soredValues.append(value!)
        }
        return (sortKeys: sortedKeys, sortValues: soredValues)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return nil
        }
        
        let title = self.sortedKeys[section]
        if title == "★" {
            return "★ 星标朋友"
        }
        return title
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return self.sortedKeys
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
