//
//  AlbumDataLoader.swift
//  Album
//
//  Created by Marlon G. Rugama on 4/22/22.
//

import Foundation

enum AlbumError: Error {
    case badData
    case badURL
    case jsonNotFound
    case decodeError
    case netWorkError
    case unknown
}

struct AlbumDataLoader {
    public func loadAlbums(completionHandler: @escaping (Result<[Album], AlbumError>) -> ()) {
        do {
            guard let jsonURLString = Bundle.main.path(forResource: "albums", ofType: "json") else {completionHandler(.failure(.jsonNotFound)); return}
            let albumURL = URL(fileURLWithPath: jsonURLString)
            guard let jsonData = try? Data(contentsOf: albumURL, options: .mappedIfSafe) else { completionHandler(.failure(.badData)); return }
            let albums = try JSONDecoder().decode(Albums.self, from: jsonData)
            completionHandler(.success(albums.results))
        } catch {
            completionHandler(.failure(.decodeError))
        }
    }
}
