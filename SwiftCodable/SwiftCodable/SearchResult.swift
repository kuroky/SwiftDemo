//
//  SearchResult.swift
//  SwiftCodable
//
//  Created by kuroky on 2018/7/30.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import Foundation

/// A result returned from the iTunes Search API.
struct SearchResult: Decodable {
    /// The name of the track, song, video, TV episode, and so on.
    let trackName: String?
    
    /// The explicitness of the track.
    let trackExplicitness: Explicitness?
    
    /// An iTunes Store URL for the content.
    let trackViewURL: URL?
    
    /// A URL referencing the 30-second preview file
    /// for the content associated with the returned media type.
    /// - Note: This is available when media type is track....
    let previewURL: URL?
    
    /// The name of the artist, and so on.
    let artistName: String?
    
    /// The name of the album, TV season, audiobook, and so on.
    let collectionName: String?
    
    /// A URL for the artwork associated with the returned media type.
    private let artworkURL100: URL?
    
    func artworkURL(size dimension: Int = 100) -> URL? {
        guard dimension > 0, dimension != 100, var url = self.artworkURL100 else {
            return self.artworkURL100
        }
        
        url.deleteLastPathComponent()
        url.appendPathComponent("\(dimension)x\(dimension)bb.jpg")
        
        return url
    }
}

extension SearchResult {
    private enum CodingKeys: String, CodingKey {
        case trackName
        case trackExplicitness
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case artistName
        case collectionName
        case artworkURL100 = "artworkUrl100"
    }
}

struct SearchResponse: Decodable {
    let results: [SearchResult]
}

extension SearchResponse {
    var nonExplicitResults: [SearchResult] {
        // 过滤敏感内容
        return self.results.filter({ (result) -> Bool in
            result.trackExplicitness != .explicit
        })
    }
}

enum Explicitness: String, Decodable {
    
    /// 歌词或封面包含敏感内容
    case explicit
    
    /// 敏感内容“净化版”歌词
    case clean
    
    /// 没有敏感歌词
    case notExplicit
}
