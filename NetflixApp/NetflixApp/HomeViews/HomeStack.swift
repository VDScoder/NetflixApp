//
//  HomeStack.swift
//  NetflixApp
//
//  Created by Дмитрий Волынкин on 23.03.2021.
//

import Foundation
import SwiftUI

struct HomeStack: View {
    var vm: HomeVM
    var topRowSelection: HomeTopRow
    var selectedGenre: HomeGenre
    
    @Binding var movieDetailToShow: Movie?
    
    var body: some View {
        ForEach(vm.allCategories, id: \.self) { category in
            VStack {
                HStack {
                    Text(category)
                        .font(.title3)
                        .bold()
                   Spacer()
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    LazyHStack {
                        ForEach(vm.getMovies(forCat: category, andHomeRow: topRowSelection, andGenre: selectedGenre)) { movie in
                            StandardHomeMovie(movie: movie)
                                .frame(width: 100, height: 200)
                                .padding(.horizontal, 20)
                                .cornerRadius(15)
                                .onTapGesture(perform: {
                                    movieDetailToShow = movie
                                        
                                })
                        }
                    }
                }
            }
        }
    }
}

struct HomeStack_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                HomeStack(vm: HomeVM(), topRowSelection: .home, selectedGenre: .AllGenres, movieDetailToShow: .constant(nil))
            }
            .foregroundColor(.white)
        }
        
    }
}
