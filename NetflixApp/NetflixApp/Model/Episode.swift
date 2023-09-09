//
//  Episode.swift
//  NetflixApp
//
//  Created by Дмитрий Волынкин on 16.03.2021.
//

import Foundation

struct Episode: Identifiable {
    var id = UUID().uuidString
    
    var name: String
    var season: Int
    var episodeNumber: Int
    var thumbnailImageUrlString: String
    var description: String
    var lenght: Int
    var videoURL: URL
    var thumbnailURL: URL {
        return URL(string: thumbnailImageUrlString)!
    }
}
