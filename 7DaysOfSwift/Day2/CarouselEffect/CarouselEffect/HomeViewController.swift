//
//  HomeViewController.swift
//  CarouselEffect
//
//  Created by kuroky on 2018/4/28.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import UIKit

let ItemCellId = "ItemCellId"

class HomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var dataList = HomeItem.createItems()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupData()
        self.setupUI()
    }
    
    func setupData() {
        
    }
    
    func setupUI() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        layout.itemSize = CGSize(width: 300, height: 300)
        layout.minimumLineSpacing = 10
        self.collectionView.collectionViewLayout = layout
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


extension HomeViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCellId, for: indexPath) as! HomeItemCell
        cell.configHomeItem(self.dataList[indexPath.row])
        return cell
    }
}
