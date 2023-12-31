//
//  Movie.swift
//  NetflixApp
//
//  Created by Дмитрий Волынкин on 12.03.2021.
//

import Foundation

struct Movie: Identifiable {
    var id: String
    var name: String
    var thumbnailURL: URL
    
    var categories: [String]
    var genre: HomeGenre = .AllGenres
    
    // Movie detail view
    
    var year: Int
    var rating: String
    var numberOfSeason: Int?
    
    // Personalization
    var currentEpisode: CurrentEpisodeInfo?
    
    
    var defaultEpisodeInfo: CurrentEpisodeInfo
    var creators: String
    var cast: String
    
    var moreLikeThisMovies: [Movie]
    
    var episods: [Episode]?
    
    var movieType: MovieType {
        return episods == nil ? .movie : .tvShow
    }
    
    var promotionHeadline: String?
    
    var trailers: [Trailer]
    
    var namberOfSeasonsDisplay: String {
        if let num = numberOfSeason {
            if num == 1 {
                return "1 seson"
            } else {
                return "\(num) seasons"
            }
        }
        return ""
    }
    
    var episodeInfoDisplay: String {
        if let current = currentEpisode {
            return "S\(current.season):E\(current.episode) \(current.episodeName)"
        }else {
            return "S\(defaultEpisodeInfo.season):E\(defaultEpisodeInfo.episode) \(defaultEpisodeInfo.episodeName)"
        }
    }
    
    var episodeDescriptionDisplay: String {
        if let current = currentEpisode {
            return current.description
        }else {
            return defaultEpisodeInfo.description
        }
    }
}

struct CurrentEpisodeInfo: Hashable, Equatable {
    var episodeName: String
    var description: String
    var season: Int
    var episode: Int
}

enum MovieType {
    case movie
    case tvShow
}
