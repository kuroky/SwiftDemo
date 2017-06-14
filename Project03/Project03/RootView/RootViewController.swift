//
//  RootViewController.swift
//  Project03
//
//  Created by kuroky on 2017/6/14.
//  Copyright © 2017年 Kuroky. All rights reserved.
//

import UIKit

class RootViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }

    func setup() {
        let homeVC = HomepageViewController.init()
        let homeNavi = MXNavigationController.init(rootViewController: homeVC);
        let homeBarItem = UITabBarItem.init(title: "首页", image: nil, selectedImage: nil)
        homeNavi.tabBarItem = homeBarItem
        
        let discoverVC = DiscoverViewController.init()
        let discoverNavi = MXNavigationController.init(rootViewController: discoverVC);
        let discoverBarItem = UITabBarItem.init(title: "发现", image: nil, selectedImage: nil)
        discoverNavi.tabBarItem = discoverBarItem
        
        let searchVC = SearchViewController.init()
        let searchNavi = MXNavigationController.init(rootViewController: searchVC);
        let searchBarItem = UITabBarItem.init(title: "搜索", image: nil, selectedImage: nil)
        searchNavi.tabBarItem = searchBarItem
        
        let profileVC = ProfileViewController.init()
        let profileNavi = MXNavigationController.init(rootViewController: profileVC);
        let profileBarItem = UITabBarItem.init(title: "我的", image: nil, selectedImage: nil)
        profileNavi.tabBarItem = profileBarItem
        
        let viewControllers = [homeNavi, discoverNavi, searchNavi, profileNavi]
        self.viewControllers = viewControllers as [UIViewController]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
