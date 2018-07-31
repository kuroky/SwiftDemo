//
//  SubViewController.swift
//  Project02
//
//  Created by kuroky on 2017/6/14.
//  Copyright © 2017年 Kuroky. All rights reserved.
//

import UIKit

class SubViewController: UIViewController {
    var detailItem: DetailItem! = nil
    var detailImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupData()
        self.setupUI()
    }
    
    func setupData() {
        
    }
    
    func setupUI() {
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = self.detailItem.title
        self.view.addSubview(self.detailImageView)
        self.detailImageView.snp.makeConstraints { (make) in
            make.center.equalTo(self.view.snp.center)
            make.width.equalTo(120)
            make.height.equalTo(120)
        }
        self.detailImageView.kf.setImage(with: URL.init(string: self.detailItem.coverUrl))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

