//
//  ViewController.swift
//  PlayLocalVideo
//
//  Created by kuroky on 2018/4/27.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import UIKit
import AVKit

let LocalVideoCellId = "LocalVideoCellId"


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var dataList:[LocalVideoItem] = []
    
    var playViewController = AVPlayerViewController()
    var playerView = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupData()
        self.setupUI()
    }

    func setupData() {
        let coverImgs:[String] = ["videoScreenshot01", "videoScreenshot02", "videoScreenshot03", "videoScreenshot04", "videoScreenshot05", "videoScreenshot06"]
        let titles:[String] = ["Introduce 3DS Mario", "Emoji Among Us", "Seals Documentary", "Adventure Time", "Facebook HQ", "Lijiang Lugu Lake"]
        let sources:[String] = ["Youtube - 06:32", "Vimeo - 3:34", "Vine - 00:06", "Youtube - 02:39", "Facebook - 10:20", "Allen - 20:30"]
        
        for i in 0..<6 {
            dataList.append(LocalVideoItem(coverImg: coverImgs[i], title: titles[i], source: sources[i]))
        }
    }
    
    func setupUI() {
        tableView.rowHeight = 220
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LocalVideoCellId, for: indexPath) as! LocalVideoCell
        cell.configCellItem(dataList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let path = Bundle.main.path(forResource: "emoji zone", ofType: "mp4")
        playerView = AVPlayer.init(url: URL.init(fileURLWithPath: path!))
        playViewController.player = playerView
        self.present(playViewController, animated: true) {
            self.playViewController.player?.play()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

