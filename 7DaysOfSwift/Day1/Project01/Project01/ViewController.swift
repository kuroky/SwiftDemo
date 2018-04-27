//
//  ViewController.swift
//  Project01
//
//  Created by kuroky on 2018/4/25.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    var timer = Timer()
    var timerIsOn = false
    var count = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countLabel.text = String(count)
    }
    
    @IBAction func clickStartButton(_ sender: UIButton) {
        if timerIsOn {
            return
        }
        timerIsOn = true;
        sender.isUserInteractionEnabled = false
        stopButton.isUserInteractionEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(timerDidCount), userInfo: nil, repeats: true)
    }
    
    @IBAction func clickStopButton(_ sender: UIButton) {
        timer.invalidate()
        timerIsOn = false;
        sender.isUserInteractionEnabled = false
        startButton.isUserInteractionEnabled = true
    }
    
    @IBAction func clickResetButton(_ sender: UIButton) {
        timer.invalidate()
        count = 0.0;
        timerIsOn = false;
        startButton.isUserInteractionEnabled = true
        stopButton.isUserInteractionEnabled = true
        self.setupLabel()
    }
    
    @objc func timerDidCount() {
        count += 0.1
        self.setupLabel()
    }
    
    func setupLabel() {
        countLabel.text = String(count)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

