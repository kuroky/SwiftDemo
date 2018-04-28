//
//  HomeItemCell.swift
//  CarouselEffect
//
//  Created by kuroky on 2018/4/28.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import UIKit

class HomeItemCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    
    func configHomeItem(_ item: HomeItem) {
        imageView.image = UIImage.init(named: item.featuredImage)
        descLabel.text = item.desc
    }
    
}
