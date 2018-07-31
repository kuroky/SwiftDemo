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
        self.setupAppearance()
        self.setup()
    }
    
    func setupAppearance() {
        
    }

    func setup() {
        let homeVC = HomepageViewController()
        let homeNavi = MXNavigationController.init(rootViewController: homeVC);
        let homeBarItem = UITabBarItem(title: "首页", image: nil, selectedImage: nil)
        homeNavi.tabBarItem = homeBarItem
        
        let discoverVC = DiscoverViewController()
        let discoverNavi = MXNavigationController.init(rootViewController: discoverVC);
        let discoverBarItem = UITabBarItem(title: "最新", image: nil, selectedImage: nil)
        discoverNavi.tabBarItem = discoverBarItem
        
        let messageVC = MessageViewController()
        let messageNavi = MXNavigationController.init(rootViewController: messageVC);
        let messageBarItem = UITabBarItem(title: "关注", image: nil, selectedImage: nil)
        messageNavi.tabBarItem = messageBarItem
        
        let profileVC = ProfileViewController()
        let profileNavi = MXNavigationController.init(rootViewController: profileVC);
        let profileBarItem = UITabBarItem(title: "更多", image: nil, selectedImage: nil)
        profileNavi.tabBarItem = profileBarItem
        
        let viewControllers: [UIViewController] = [homeNavi, discoverNavi, messageNavi, profileNavi]
        self.viewControllers = viewControllers
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
