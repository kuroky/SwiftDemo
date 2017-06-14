//
//  SubViewController.swift
//  Project02
//
//  Created by kuroky on 2017/6/14.
//  Copyright © 2017年 Kuroky. All rights reserved.
//

import UIKit

class SubViewController: UIViewController {

    var detailItem:DetailItem! = nil
    @IBOutlet var detaiImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    func setupUI() {
        self.navigationItem.title = self.detailItem.title
        self.detaiImageView.kf.setImage(with: URL.init(string: self.detailItem.coverUrl))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
