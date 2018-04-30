//
//  ViewController.swift
//  RandomColor
//
//  Created by kuroky on 2018/4/28.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    let gradientlayer = CAGradientLayer()
    var timer = Timer()
    var timerIsOn = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupData()
        self.setupUI()
    }
    
    func setupData() {
        let musicPath = Bundle.main.path(forResource: "Ecstasy", ofType: "mp3")
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            try audioPlayer = AVAudioPlayer.init(contentsOf: URL.init(fileURLWithPath: musicPath!))
        } catch let error as NSError {
            print(error)
        }
    }

    func setupUI() {
        let redValue = CGFloat(drand48())
        let blueValue =  CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        
        self.view.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
        
        //graditent color
        self.gradientlayer.frame = view.bounds
        let color1 = UIColor(white: 0.5, alpha: 0.2).cgColor as CGColor
        let color2 = UIColor(red: 1.0, green: 0, blue: 0, alpha: 0.4).cgColor as CGColor
        let color3 = UIColor(red: 0, green: 1, blue: 0, alpha: 0.3).cgColor as CGColor
        let color4 = UIColor(red: 0, green: 0, blue: 1, alpha: 0.3).cgColor as CGColor
        let color5 = UIColor(white: 0.4, alpha: 0.2).cgColor as CGColor
        
        self.gradientlayer.colors = [color1, color2, color3, color4, color5]
        self.gradientlayer.locations = [0.10, 0.30, 0.50, 0.70, 0.90]
        self.gradientlayer.startPoint = CGPoint(x: 0, y: 0)
        self.gradientlayer.endPoint = CGPoint(x: 1, y: 1)
        
        self.view.layer.addSublayer(self.gradientlayer)
    }
    
    @IBAction func clickRandomButton(_ sender: UIButton) {
        if self.timerIsOn {
            self.timer.invalidate()
            self.audioPlayer.stop()
            self.timerIsOn = false
            return
        }
        
        self.audioPlayer.play()
        self.timerIsOn = true
        self.timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(timerCount), userInfo: nil, repeats: true)
    }
    
    @objc func timerCount() {
        let redValue = CGFloat(drand48())
        let blueValue =  CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        
        
        self.view.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

