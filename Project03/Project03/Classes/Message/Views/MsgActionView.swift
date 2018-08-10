//
//  MsgActionView.swift
//  Project03
//
//  Created by kuroky on 2018/8/10.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import UIKit

struct ActionItem {
    var title: String?
    var image: String?
    
    init(title: String, image: String) {
        self.title = title
        self.image = image
    }
}

class MsgActionView: UIView {
    
    @IBOutlet weak var tableView: UITableView!
    var dataList = [ActionItem]()
    
    class func initFromNib() -> MsgActionView {
        let actionView = Bundle.main.loadNibNamed("MsgActionView", owner: self, options: nil)?.first
        return actionView as! MsgActionView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupData()
        self.setupTableView()
    }
    
    func setupData() {
        self.dataList.append(ActionItem(title: "发起群聊", image: "contacts_add_newmessage"))
        self.dataList.append(ActionItem(title: "添加朋友", image: "barbuttonicon_add_cube"))
        self.dataList.append(ActionItem(title: "扫一扫", image: "contacts_add_scan"))
        self.dataList.append(ActionItem(title: "收付款", image: "receipt_payment_icon"))
        self.backgroundColor = UIColor.clear
    }
    
    func setupTableView() {
        self.tableView.rowHeight = 47
        self.tableView.register(UINib(nibName: "MsgActionCell", bundle: nil), forCellReuseIdentifier: "actionCell")
        let stretchInsets = UIEdgeInsetsMake(14, 6, 6, 34)
        let bubbleMaskImage = UIImage(named: "MessageRightTopBg")?.resizableImage(withCapInsets: stretchInsets, resizingMode: .stretch)
        let bgImageView: UIImageView = UIImageView(image: bubbleMaskImage)
        self.tableView.backgroundView = bgImageView
    }
}

extension MsgActionView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "actionCell", for: indexPath)
        (cell as! MsgActionCell).configActionItem(item: self.dataList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}

extension MsgActionView {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.isHidden = true
    }
}
