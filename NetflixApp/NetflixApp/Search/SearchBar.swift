//
//  SaerchBar.swift
//  NetflixApp
//
//  Created by Дмитрий Волынкин on 19.05.2021.
//

//import SwiftUI
//
//struct SearchBar: View {
//    
//    @Binding private var text: String
//    @State private var isEditing = true
//    @Binding private var isLoading: Bool
//    var body: some View {
//        ZStack(alignment: .leading) {
//            Color.graySearchBackground
//                .frame(width: 300, height: 36)
//                .cornerRadius(7)
//            HStack {
//                Image(systemName: "magnifyingglass")
//                    .foregroundColor(Color.graySearchText)
//                    .padding(.leading, 10)
//                TextField("Search", text: $text)
//                    .background(Color.graySearchBackground)
//                    .cornerRadius(7)
//                    .foregroundColor(.white)
//                    .padding(7)
//                    .padding(.leading, -7)
//                    .onTapGesture(perform: {
//                        isEditing = true
//                    })
//                
//                if isLoading {
//                    Text("X")
//                        .frame(width: 35, height: 35)
//                }else {
//                    
//                    Button(action: {
//                        text = ""
//                    }, label: {
//                        Image(systemName: "xmark.circle.fill")
//                            .foregroundColor(.graySearchText)
//                            .frame(width: 35, height: 35)
//                    })
//                    .padding(.trailing, 18)
//                    
//                }
//                
//                
//                
//                Button(action: {
//                    text = ""
//                    isEditing = false
//                }, label: {
//                    Text("Cancel")
//                        .foregroundColor(.graySearchText)
//                }).padding(.trailing, 10)
//                
//                
//            }
//        }
//        
//    }
//    
//}
//
//struct SaerchBar_Previews: PreviewProvider {
//    static var previews: some View {
//        ZStack {
//            Color.black
//                .edgesIgnoringSafeArea(.all)
//            SearchBar()
//                .padding()
//        }
//        
//    }
//}
