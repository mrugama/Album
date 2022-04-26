//
//  AlbumModel.swift
//  Album
//
//  Created by Marlon G. Rugama on 4/22/22.
//

import Foundation
import UIKit

struct Albums: Decodable {
    var results: [Album]

    @discardableResult mutating func addAlbum(_ album: Album) -> Album {
        self.results.append(album)
        return album
    }
}

struct Album: Decodable {
    let artist_name: String
    let album_title: String
    let cover_art: String
}


