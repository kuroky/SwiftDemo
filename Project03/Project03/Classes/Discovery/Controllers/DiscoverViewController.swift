//
//  DiscoverViewController.swift
//  Project03
//
//  Created by kuroky on 2017/6/14.
//  Copyright © 2017年 Kuroky. All rights reserved.
//

import UIKit

class DiscoverViewController: MXTableViewController {

    let kDiscoveryCellId = "discoveryCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupData()
        self.setupUI()
    }
    
    func setupData() {
        self.dataList.append([DiscoverItem(title: "朋友圈", image: "ff_IconShowAlbum")])
        
        var section = [DiscoverItem]()
        section.append(DiscoverItem(title: "扫一扫", image: "ff_IconQRCode"))
        section.append(DiscoverItem(title: "摇一摇", image: "ff_IconShake"))
        self.dataList.append(section)
        
        section = [DiscoverItem]()
        section.append(DiscoverItem(title: "附近的人", image: "ff_IconLocationService"))
        section.append(DiscoverItem(title: "漂流瓶", image: "ff_IconBottle"))
        self.dataList.append(section)
        
        self.dataList.append([DiscoverItem(title: "游戏", image: "MoreGame")])
    }
    
    func setupUI() {
        self.navigationItem.title = "发现"
        self.view.backgroundColor = UIColor.mx_colorOfHex(hexString: "E7EBEE")
        self.setupTableView()
    }
    
    func setupTableView() {
        self.rowHeight = 44
        self.sectionIsSingle = false
        self.cellIdentifier = kDiscoveryCellId
        self.tableView.backgroundColor = UIColor.mx_colorOfHex(hexString: "EFEFF4")
        let nib:UINib = UINib.init(nibName: "DiscoverListCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: kDiscoveryCellId)
        
        self.headerHeightClosure = { section in
            return section == 0 ? 15 : 20
        }
        
        self.mx_reloadData { (cell, item) in
            (cell as! DiscoverListCell).configDiscoverData(item: (item as! DiscoverItem))
        }
    }

    // MARK: UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
