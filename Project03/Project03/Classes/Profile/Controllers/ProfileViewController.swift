//
//  ProfileViewController.swift
//  Project03
//
//  Created by kuroky on 2017/6/14.
//  Copyright © 2017年 Kuroky. All rights reserved.
//

import UIKit

class ProfileViewController: MXTableViewController {

    let kProfileCellId = "ProfielCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupData()
        self.setupUI()
    }
    
    func setupData() {
        self.dataList.append([ProfileItem(title: "KKKK", image: "Kenny", type: .UserHead)])
        
        var section = [ProfileItem]()
        section.append(ProfileItem(title: "相册", image: "MoreMyAlbum", type: .Photo))
        section.append(ProfileItem(title: "收藏", image: "MoreMyFavorites", type: .Photo))
        section.append(ProfileItem(title: "钱包", image: "MoreMyBankCard", type: .Photo))
        section.append(ProfileItem(title: "优惠券", image: "MyCardPackageIcon", type: .Photo))
        self.dataList.append(section)
        
        self.dataList.append([ProfileItem(title: "表情", image: "MoreExpressionShops", type: .Photo)])
        
        self.dataList.append([ProfileItem(title: "游戏", image: "MoreSetting", type: .Photo)])
    }
    
    func setupUI() {
        self.navigationItem.title = "我的"
        self.setupTableView()
    }
    
    func setupTableView() {
        self.sectionIsSingle = false
        self.cellIdentifier = kProfileCellId
        self.tableView.backgroundColor = UIColor.mx_colorOfHex(hexString: "EFEFF4")
        self.tableView.register(UINib(nibName: "ProfileCell", bundle: nil), forCellReuseIdentifier: kProfileCellId)
                
        self.headerHeightClosure = { section in
            if section == 0 {
                return 15
            }
            return 20
        }
        
        self.cellHeightClosure = { indexPath in
            if indexPath.section == 0 {
                return 88
            }
            return 44
        }
        
        self.mx_reloadData { (cell, item) in
            (cell as! ProfileCell).configDiscoverData(item: (item as! ProfileItem))
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
        
        let vc = UIViewController.init()
        vc.view.backgroundColor = UIColor.white
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
