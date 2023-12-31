//
//  StandardHomeMovie.swift
//  NetflixApp
//
//  Created by Дмитрий Волынкин on 12.03.2021.
//

import SwiftUI
import KingfisherSwiftUI

struct StandardHomeMovie: View {
    var movie: Movie
    var body: some View {
        KFImage(movie.thumbnailURL)
            .resizable()
            .scaledToFill()
            
    }
}

struct StandardHomeMovie_Previews: PreviewProvider {
    static var previews: some View {
        StandardHomeMovie(movie: exampleMovie1)
           
    }
}
