//
//  TopMoviePreview.swift
//  NetflixApp
//
//  Created by Дмитрий Волынкин on 12.03.2021.
//

import SwiftUI
import KingfisherSwiftUI

struct TopMoviePreview: View {
    
    var movie: Movie
    
    func isCategoryLast(_ cat: String) -> Bool {
        let catCount = movie.categories.count
        
        if let index = movie.categories.firstIndex(of: cat) {
            if index + 1 != catCount {
                return false
                
            }
        }
        return true
    }
    
    var body: some View {
        ZStack {
            KFImage(movie.thumbnailURL)
                .resizable()
                .scaledToFill()
                .clipped()
            
            VStack {
                Spacer()
                
                HStack {
                    ForEach(movie.categories, id: \.self) { category in
                        
                        HStack {
                            Text(category)
                                .font(.footnote)
                                .foregroundColor(.white)
                            if !isCategoryLast(category) {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 2))
                            }
                            
                        }
                    }
                }.offset(y: -20)

                
                HStack {
                    Spacer()
                    SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: true) {
                        //
                    }
                    
                    Spacer()
                    
                    PlayButton(text: "play", imageName: "play.fill") {
                        //
                    }.frame(width: 120)
                    
                    Spacer()
                    
                    SmallVerticalButton(text: "Info", isOnImage: "info.circle", isOffImage: "info.circle", isOn: true) {
                        //
                    }
                    
                    Spacer()
                }
            }.background(
                LinearGradient.blackopacityGradient
            .padding(.top, 200))
        }
        .foregroundColor(.white)
    }
}

struct TopMoviePreview_Previews: PreviewProvider {
    static var previews: some View {
        TopMoviePreview(movie: exampleMovie5)
    }
}
