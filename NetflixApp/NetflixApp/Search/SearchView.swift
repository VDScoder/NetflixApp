//
//  SearchView.swift
//  NetflixApp
//
//  Created by Дмитрий Волынкин on 21.05.2021.
//

import SwiftUI

struct SearchView: View {
    var vm = SearchVM()
    @State private var searchText = ""
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                //SearchBar()
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
