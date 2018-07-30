//
//  SearchResultViewController.swift
//  SwiftCodable
//
//  Created by kuroky on 2018/7/30.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import UIKit

class SearchResultViewController: UITableViewController {

    var dataTask: URLSessionTask? = nil
    var results: [SearchResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchSearchData(for: Music.self, with: "Swift")
    }
    
    func setupUI() {
        self.navigationItem.title = "使用iTunes Search API 构建音乐商店应用"
        self.tableView.rowHeight = 120
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    func fetchSearchData<T>(for type: T.Type, with term: String) where T: MediaType {
        let components = AppleiTunesSearchURLComponents<T>(term: term)
        guard let url = components.url else {
            fatalError("error creating url")
        }
        
        print("searchUrl: \(url)")
        self.dataTask?.cancel()
        
        self.dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {
                fatalError("Networking error \(String(describing: error))\(String(describing: response))")
            }
            
            let decoder = JSONDecoder()
            if let searchResponse = try? decoder.decode(SearchResponse.self, from: data) {
                self.results = searchResponse.results
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        self.dataTask?.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = results[indexPath.row]
        cell.textLabel?.text = item.trackName
        return cell
    }
}
