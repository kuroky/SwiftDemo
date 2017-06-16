//
//  LoginViewController.swift
//  Project03
//
//  Created by kuroky on 2017/6/15.
//  Copyright © 2017年 Kuroky. All rights reserved.
//

import UIKit

class LoginViewController: MXViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func clickLoginBtn(_ sender: UIButton) {
        if MXLoginManager.signManager.mxIsLogin! {
            MXLoginManager.signManager.mx_Logout()
        }
        else {
            MXLoginManager.signManager.mx_Login()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
