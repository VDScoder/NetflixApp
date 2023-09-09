//
//  Trailer.swift
//  NetflixApp
//
//  Created by Дмитрий Волынкин on 20.03.2021.
//

import Foundation

struct Trailer: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var name: String
    var videoURL: URL
    var thumbnailImageURL: URL
}
