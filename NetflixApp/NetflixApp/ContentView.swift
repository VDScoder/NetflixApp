//
//  ContentView.swift
//  NetflixApp
//
//  Created by Дмитрий Волынкин on 12.03.2021.
//

import SwiftUI

struct ContentView: View {
    
    
    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor.black
    }
    var body: some View {
       
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("HOME")
                }.tag(0)
            
            //SearchBar()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("SEARCH")
                }.tag(1)
            
            Text("Coming Soon")
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("SOON")
                }.tag(2)
            
            Text("Downloads")
                .tabItem {
                    Image(systemName: "arrow.down.to.line.alt")
                    Text("DOWNLOADS")
                }.tag(3)
            
            Text("More")
                .tabItem {
                    Image(systemName: "equal")
                    Text("MORE")
                }.tag(4)
        }.accentColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
