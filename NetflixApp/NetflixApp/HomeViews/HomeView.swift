//
//  HomeView.swift
//  NetflixApp
//
//  Created by Дмитрий Волынкин on 12.03.2021.
//

import SwiftUI

struct HomeView: View {
    var vm: HomeVM = HomeVM()
    
    let screen = UIScreen.main.bounds
    
    @State private var movieDetailToShow: Movie? = nil
    @State private var topRowSelection: HomeTopRow = .home
    @State private var homeGenre: HomeGenre = .AllGenres
    
    @State private var showGenreSelection = false
    @State private var showTopRowSelection = false
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            // main vstak here
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    
                    TopRowButtons(topRowSelection: $topRowSelection, homeGenre: $homeGenre, showGenreSelection: $showGenreSelection, showTopRowSelection: $showTopRowSelection)
                    
                    TopMoviePreview(movie: exampleMovie6)
                        .frame(width: screen.width)
                        .padding(.top, -120)
                        .zIndex(-1)
                    
                    
                    HomeStack(vm: vm, topRowSelection: topRowSelection, selectedGenre: homeGenre, movieDetailToShow: $movieDetailToShow)
                }
            }
            if movieDetailToShow != nil {
                MovieDitail(movie: movieDetailToShow!, movieDetailToShow: $movieDetailToShow)
                    .animation(.easeIn)
                    .transition(.opacity)
            }
            
            if showTopRowSelection {
                Group {
                    Color.black.opacity(0.82)
                    
                    VStack(spacing: 40) {
                        
                        
                        Spacer()
                        ForEach(HomeTopRow.allCases, id:\.self) { topRow in
                            
                            Button(action: {
                                topRowSelection = topRow
                                showTopRowSelection = false
                            }, label: {
                                if topRowSelection == topRow {
                                    Text("\(topRow.rawValue)")
                                        .bold()
                                }else{
                                    Text("\(topRow.rawValue)")
                                        .foregroundColor(.gray)
                                }
                            })
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            showTopRowSelection = false
                        }, label: {
                            Image(systemName: "x.circle.fill")
                                .font(.system(size: 50))
                                .foregroundColor(.white)
                                .scaleEffect(x: 1.1)
                        }).padding(.bottom, 30)
                        
                        
                    }
                    
                }.edgesIgnoringSafeArea(.all)
                .font(.title2)
                
            }
            
            if showGenreSelection {
                Group {
                    Color.black.opacity(0.82)
                    
                    VStack(spacing: 40) {
                        
                        
                        Spacer()
                        
                        ScrollView {
                        ForEach(vm.allGenre, id:\.self) { genre in
                            
                            Button(action: {
                                homeGenre = genre
                                showGenreSelection = false
                            }, label: {
                                if homeGenre == genre {
                                    Text("\(genre.rawValue)")
                                        .bold()
                                }else{
                                    Text("\(genre.rawValue)")
                                        .foregroundColor(.gray)
                                }
                            }).padding(.bottom, 40)
                        }
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            showGenreSelection = false
                        }, label: {
                            Image(systemName: "x.circle.fill")
                                .font(.system(size: 50))
                                .foregroundColor(.white)
                                .scaleEffect(x: 1.1)
                        }).padding(.bottom, 30)
                        
                        
                    }
                        
                    
                }.edgesIgnoringSafeArea(.all)
                .font(.title2)
                
            }
            
            
        }
        .foregroundColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct TopRowButtons: View {
    
    @Binding var topRowSelection: HomeTopRow
    @Binding var homeGenre: HomeGenre
    
    @Binding var showGenreSelection: Bool
    @Binding var showTopRowSelection: Bool
    
    var body: some View {
        switch topRowSelection {
        case .home:
            HStack {
                Button(action: {
                    topRowSelection = .home
                }, label: {
                    Image("netflixLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                })
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
                
                Button(action: {
                    topRowSelection = .tvShows
                }, label: {
                    Text("TV shows")
                })
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
                
                Button(action: {
                    topRowSelection = .movies
                }, label: {
                    Text("Movies")
                })
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
                
                Button(action: {
                    topRowSelection = .myList
                    
                }, label: {
                    Text("My List")
                })
                .buttonStyle(PlainButtonStyle())
                
            }
            .padding(.leading, 10)
            .padding(.trailing, 30)
            
        case .tvShows, .myList, .movies:
            HStack {
                Button(action: {
                    topRowSelection = .home
                }, label: {
                    Image("netflixLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                })
                .buttonStyle(PlainButtonStyle())
                
                
                
                HStack(spacing: 20) {
                    Button(action: {
                        showTopRowSelection = true
                    }, label: {
                        HStack {
                            Text(topRowSelection.rawValue)
                                .font(.system(size: 18))
                            Image(systemName: "triangle.fill")
                                .rotationEffect(.degrees(180), anchor: .center)
                                .font(.system(size: 10))
                        }
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    
                    Button(action: {
                        showGenreSelection = true
                    }, label: {
                        HStack {
                            Text(homeGenre.rawValue)
                                .font(.system(size: 12))
                            Image(systemName: "triangle.fill")
                                .rotationEffect(.degrees(180), anchor: .center)
                                .font(.system(size: 6))
                        }
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                    
                }
                
            }
            .padding(.leading, 10)
            .padding(.trailing, 30)
        }
        
    }
}

enum HomeTopRow: String, CaseIterable {
    case home = "Home"
    case tvShows = "TV shows"
    case movies = "Movies"
    case myList = "My List"
    
}

enum HomeGenre: String {
    case AllGenres
    case Action
    case Comedy
    case Horror
    case Triller
}


