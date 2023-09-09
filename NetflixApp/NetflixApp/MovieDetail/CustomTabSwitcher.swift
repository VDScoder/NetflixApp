//
//  CustomTabSwitcher.swift
//  NetflixApp
//
//  Created by Дмитрий Волынкин on 20.03.2021.
//

import SwiftUI

enum CustomTab: String {
    case episodes = "EPISODES"
    case trailers = "TRAILERS"
    case more = "MORE LIKE THIS"
}

struct CustomTabSwitcher: View {
    
    @State private var currentTab: CustomTab = .episodes
    
    var tabs: [CustomTab]
    var movie: Movie
    
    @Binding var showSeasonPicker: Bool
    @Binding var selectedSeason: Int
    
    func widthFofTab(_ tab: CustomTab) -> CGFloat {
        let string = tab.rawValue
        return string.widthOfString(usingFont: .systemFont(ofSize: 16, weight: .bold))
    }
    
    var body: some View {
        VStack {
            // Custom Tab picker
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    ForEach(tabs, id: \.self) { tab  in
                        VStack {
                            //Red bar
                            Rectangle()
                                .frame(width: widthFofTab(tab), height: 6)
                                .foregroundColor(tab == currentTab ? .red : .clear)
                            
                            //Button
                            Button(action: {
                                currentTab = tab
                            }, label: {
                                Text(tab.rawValue)
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(tab == currentTab ? .white : .gray)
                            })
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: widthFofTab(tab), height: 30)
                            
                            }
                    }
                }.padding(.leading, 20)
            }
        
            // Selected View
            
            switch currentTab {
            case .episodes:
                EpisodesView(showSeasonPicker: $showSeasonPicker, selectedSeason: $selectedSeason, episodes: movie.episods ?? [])
            case .trailers:
                TrailerList(trailers: movie.trailers)
            case .more:
                MoreLikeThis(movies: movie.moreLikeThisMovies)
            }
        }
        .foregroundColor(.white)
    }
}


struct CustomTabSwitcher_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            CustomTabSwitcher(tabs: [.episodes, .trailers, .more], movie: exampleMovie1, showSeasonPicker: .constant(false), selectedSeason: .constant(2))
        }
        
    }
}
