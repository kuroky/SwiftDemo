//
//  ContactsViewController.swift
//  Project03
//
//  Created by kuroky on 2018/8/6.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import UIKit
import SnapKit

class ContactsViewController: MXTableViewController {
    
    let cellId  =   "contactsCellId"
    var sortedKeys: [String] = Array()
    lazy var footView: ContactFootView = {
        let footView = Bundle.main.loadNibNamed("ContactFootView", owner: self, options: nil)?.first as! ContactFootView
        footView.frame = CGRect(x: 0, y: 0, width: UIDevice.mx_deviceWidth(), height: 40)
        return footView
    } ()
    
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
        self.tableView.tableFooterView = self.footView
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
        
        // 星标联系人
        let starContacts = contacts.data?.first
        self.dataList.append(starContacts!)
        self.sortedKeys.append("★")
        
        let otherContacts = contacts.data?.last
        let sortResult = self.sortedContacts(tempList: otherContacts!)
        self.dataList.append(contentsOf: sortResult.sortValues)
        self.sortedKeys.append(contentsOf: sortResult.sortKeys)
        
        self.footView.configCount(count: otherContacts?.count)
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
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return nil
        }
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        view.backgroundColor = UIColor.mx_colorOfHex(hexString: "EFEFF4")
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: 100, height: 20))
        label.textColor = UIColor.mx_colorOfHex(hexString: "1AAD19")
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        var title = self.sortedKeys[section]
        title = title == "★" ? "★ 星标朋友" : title
        label.text = self.sortedKeys[section]
        view .addSubview(label)
        return view
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return self.sortedKeys
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
