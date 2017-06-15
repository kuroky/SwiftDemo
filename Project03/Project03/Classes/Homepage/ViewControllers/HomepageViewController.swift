//
//  HomepageViewController.swift
//  Project03
//
//  Created by kuroky on 2017/6/14.
//  Copyright © 2017年 Kuroky. All rights reserved.
//

import UIKit

let kHomepageCellId = "HomepageCellId"


class HomepageViewController: MXViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    func setupUI() {
        self.navigationItem.title = "首页"
        self.setupCollectionView()
    }
    
    func setupCollectionView() {
        let flowLayout = UICollectionViewFlowLayout.init()
        flowLayout.itemSize = CGSize(width:120, height:100)
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 2
        self.collectionView.collectionViewLayout = flowLayout
        let nib = UINib.init(nibName: "HomepageCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: kHomepageCellId)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:HomepageCell = collectionView.dequeueReusableCell(withReuseIdentifier: kHomepageCellId, for: indexPath) as! HomepageCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
