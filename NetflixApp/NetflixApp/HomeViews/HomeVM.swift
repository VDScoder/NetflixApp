//
//  HomeVM.swift
//  NetflixApp
//
//  Created by Дмитрий Волынкин on 12.03.2021.
//

import Foundation

class HomeVM: ObservableObject {
    
    @Published var movies: [String : [Movie]] = [:]
    
    public var allCategories: [String] {
        return movies.keys.map({ String($0) })
    }
    
    public var allGenre: [HomeGenre] = [.AllGenres, .Comedy, .Action, .Horror, .Triller]
    
    public func getMovies(forCat cat: String, andHomeRow homeRow: HomeTopRow, andGenre genre: HomeGenre) -> [Movie] {
        
        switch homeRow {
        case .home:
        return movies[cat] ?? []
        case .movies:
            return (movies[cat] ?? []).filter({ ($0.movieType == .movie) && ( $0.genre == genre) })
        case .tvShows:
            return (movies[cat] ?? []).filter({ ($0.movieType == .tvShow) && ($0.genre == genre) })
        case .myList:
            return movies[cat] ?? []
            // setup mylist property
        }
        
    }
    
    init() {
        setupMovies()
    }
    
    func setupMovies() {
        movies["Trending Now"] = exampleMovies
        movies["Stend-Up Comedy"] = exampleMovies.shuffled()
        movies["New Releases"] = exampleMovies.shuffled()
        movies["Watch it again"] = exampleMovies.shuffled()
        movies["Sci-fi"] = exampleMovies.shuffled()
    }
}
