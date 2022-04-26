//
//  AlbumViewModel.swift
//  Album
//
//  Created by Marlon G. Rugama on 4/22/22.
//

import Foundation

protocol AlbumViewModel {
    func getAlbum(at index: Int) -> Album
    func getNumberOfAlbums() -> Int
}

struct AlbumViewModelImpl: AlbumViewModel {
    private let albums: [Album]

    init(albums: [Album]) {
        self.albums = albums
    }

    func getAlbum(at index: Int) -> Album {
        return albums[index]
    }

    func getNumberOfAlbums() -> Int {
        return albums.count
    }
}
