//
//  UIImageView+MXAdd.swift
//  Project03
//
//  Created by kuroky on 2018/8/8.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import Foundation
import Kingfisher

extension UIImageView {
    
    /// 加载网络图片并裁剪到指定大小
    func mx_setImageWithURL(urlString: String?, fittedSize: CGSize?, placeholder: String?) {
        
        // 判断url和placeholder
        if urlString?.count == 0 && placeholder?.count == 0 {
            return
        }
        
        // 判断url
        guard let str = urlString else {
            self.image = UIImage(named: placeholder!)
            return
        }
        
        // 加载原图
        guard let size = fittedSize else {
            self.kf.setImage(with: URL(string: str), placeholder: UIImage(named: placeholder!))
            return
        }
        
        // 缓存key
        let cacheKey = self.cropWithURL(urlString: str, cropSize: size)
        
        // 取内存
        if let memoryImage = KingfisherManager.shared.cache.retrieveImageInMemoryCache(forKey: cacheKey) {
            self.image = memoryImage
            return
        }
        
        // 取磁盘
        if let diskImage = KingfisherManager.shared.cache.retrieveImageInDiskCache(forKey: cacheKey) {
            self.image = diskImage
            return
        }
        
        // 下载
        KingfisherManager.shared.downloader.downloadImage(with: URL(string: str)!, options: []) { (image, error, imageUrl, originalData) in
            if let image = image, let originalData = originalData {
                self.cacheImage(image: image, imageData: originalData, cropSize:size, cacheKey: cacheKey, handler: {
                    self.image = image
                })
            }
        }
    }
    
    // 缓存
    func cacheImage(image: UIImage, imageData: Data, cropSize: CGSize, cacheKey: String, handler: (() -> Void)?) {
        DispatchQueue.global(qos: .default).async {
            let corpImage = image.mx_cropToBounds(image: image, width: Double(cropSize.width), height: Double(cropSize.height))
            KingfisherManager.shared.cache.store(corpImage, original: imageData, forKey: cacheKey, toDisk: true, completionHandler: handler)
        }
    }
    
    // 指定缓存的url key
    func cropWithURL(urlString: String, cropSize: CGSize) -> String {
        let url = URL(string: urlString)
        let sizeStr = "_" + String(format: "%.0f", cropSize.width) + "_" + String(format: "%.0f", cropSize.height);
        let pathStr = (url?.deletingPathExtension().absoluteString)! + sizeStr
        let urlExtension = url?.pathExtension
        return (urlExtension != nil) ? pathStr + urlExtension! : pathStr
    }
}
