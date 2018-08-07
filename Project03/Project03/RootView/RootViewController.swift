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
        self.setupViewControllers()
    }
    
    private func setupAppearance() {
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.lightGray], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.colorOfHexString(hexString: "68BB1E")], for: .selected)
        
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().barTintColor = UIColor.colorOfHexString(hexString: "1A1A1A")
        UINavigationBar.appearance().isTranslucent = true
        
        let attributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17),
                          NSAttributedStringKey.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = attributes
    }

    private func setupViewControllers() {
        let messageNavi = MXNavigationController.init(rootViewController: MessageViewController());
        let messageBarItem = UITabBarItem(title: "消息", image: self.normalImage(name: "tabbar_mainframe"), selectedImage: self.selectImage(name: "tabbar_mainframeHL"))
        messageNavi.tabBarItem = messageBarItem
        
        let contactsNavi = MXNavigationController.init(rootViewController: ContactsViewController());
        let contactBarItem = UITabBarItem(title: "通讯录", image: self.normalImage(name: "tabbar_contacts"), selectedImage: self.normalImage(name: "tabbar_contactsHL"))
        contactsNavi.tabBarItem = contactBarItem
        
        let discoverVC = DiscoverViewController()
        let discoverNavi = MXNavigationController.init(rootViewController: discoverVC);
        let discoverBarItem = UITabBarItem(title: "发现", image: self.normalImage(name: "tabbar_discover"), selectedImage: self.normalImage(name: "tabbar_discoverHL"))
        discoverNavi.tabBarItem = discoverBarItem
        
        let profileVC = ProfileViewController()
        let profileNavi = MXNavigationController.init(rootViewController: profileVC);
        let profileBarItem = UITabBarItem(title: "我", image: self.normalImage(name: "tabbar_me"), selectedImage: self.normalImage(name: "tabbar_meHL"))
        profileNavi.tabBarItem = profileBarItem
        
        let viewControllers: [UIViewController] = [messageNavi, contactsNavi, discoverNavi, profileNavi]
        self.viewControllers = viewControllers
    }

    private func normalImage(name: String) -> UIImage {
        return UIImage.originalImage(name: name)
    }
    
    private func selectImage(name: String) -> UIImage {
        return UIImage.originalImage(name: name)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
