//
//  ViewController.swift
//  ImageScroller
//
//  Created by kuroky on 2018/4/30.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewLeadingConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.delegate = self
        self.scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.updateMinZoomScaleForSize(self.view.bounds.size)
    }
    
    func updateMinZoomScaleForSize(_ size: CGSize) {
        let widthScale = size.width / imageView.bounds.size.width
        let heightScale = size.width / imageView.bounds.size.height
        
        let minScale = min(widthScale, heightScale)
        
        self.scrollView.minimumZoomScale = minScale
        self.scrollView.maximumZoomScale = 3
        self.scrollView.zoomScale = minScale
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        self.updateConstraintsForSize(self.view.bounds.size)
    }
    
    func updateConstraintsForSize(_ size: CGSize) {
        let yOffset = max(0, (size.height - self.imageView.frame.height) / 2)
        self.imageViewTopConstraint.constant = yOffset
        self.imageViewBottomConstraint.constant = yOffset
        
        ////根据宽度计算imageView前后约束的偏移量
        let xOffset = max(0, (size.width - self.imageView.frame.width) / 2)
        self.imageViewLeadingConstraint.constant = xOffset
        self.imageViewTrailingConstraint.constant = xOffset
        
        self.view.layoutIfNeeded()
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

