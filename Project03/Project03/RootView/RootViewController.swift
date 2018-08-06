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
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.lightGray], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.colorOfHexString(hexString: "68BB1E")], for: .selected)
    }

    func setup() {
        let messageNavi = MXNavigationController.init(rootViewController: MessageViewController());
        let messageBarItem = UITabBarItem(title: "消息", image: UIImage(named: "tabbar_mainframe")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "tabbar_mainframeHL")?.withRenderingMode(.alwaysOriginal))
        messageNavi.tabBarItem = messageBarItem
        
        let contactsNavi = MXNavigationController.init(rootViewController: ContactsViewController());
        let contactBarItem = UITabBarItem(title: "通讯录", image: nil, selectedImage: nil)
        contactsNavi.tabBarItem = contactBarItem
        
        let discoverVC = DiscoverViewController()
        let discoverNavi = MXNavigationController.init(rootViewController: discoverVC);
        let discoverBarItem = UITabBarItem(title: "发现", image: nil, selectedImage: nil)
        discoverNavi.tabBarItem = discoverBarItem
        
        let profileVC = ProfileViewController()
        let profileNavi = MXNavigationController.init(rootViewController: profileVC);
        let profileBarItem = UITabBarItem(title: "我", image: nil, selectedImage: nil)
        profileNavi.tabBarItem = profileBarItem
        
        let viewControllers: [UIViewController] = [messageNavi, contactsNavi, discoverNavi, profileNavi]
        self.viewControllers = viewControllers
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
