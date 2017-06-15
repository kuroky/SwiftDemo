//
//  DiscoverViewController.swift
//  Project03
//
//  Created by kuroky on 2017/6/14.
//  Copyright © 2017年 Kuroky. All rights reserved.
//

import UIKit

let kDiscoveryCellId = "discoveryCellId"

class DiscoverViewController: MXViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    func setupUI() {
        self.navigationItem.title = "发现"
        self.setupTableView()
    }
    
    func setupTableView() {
        let nib:UINib = UINib.init(nibName: "DiscoverListCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: kDiscoveryCellId)
        self.tableView.rowHeight = 49
    }

    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:DiscoverListCell = tableView.dequeueReusableCell(withIdentifier: kDiscoveryCellId, for: indexPath) as! DiscoverListCell
        return cell
    }
    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
