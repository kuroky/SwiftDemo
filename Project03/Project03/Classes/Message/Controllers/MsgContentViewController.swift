//
//  MsgContentViewController.swift
//  Project03
//
//  Created by kuroky on 2018/8/11.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import UIKit

class MsgContentViewController: MXViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupData()
        self.setupUI()
    }
    
    func setupData() {
        
    }
    
    func setupUI() {
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension MsgContentViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
