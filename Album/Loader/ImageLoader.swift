//
//  ImageLoader.swift
//  Album
//
//  Created by Marlon G. Rugama on 4/22/22.
//

import Foundation
import UIKit

struct ImageLoader {
    private static let userDefaults = UserDefaults(suiteName: "ALbumImageCache")

    static func loadImage(from urlString: String, completion: @escaping (Result<UIImage, AlbumError>) -> Void) {
        guard let userDefaults = userDefaults else { completion(.failure(.unknown)); return }
        if let data = userDefaults.object(forKey: urlString) as? Data {
            guard let image = UIImage(data: data) else { completion(.failure(.badData)); return }
            completion(.success(image))
            return
        }
        guard let url = URL(string: urlString) else {
            completion(.failure(.badURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let _ = error {
                completion(.failure(.netWorkError))
                return
            }

            if let data = data {
                userDefaults.set(data, forKey: urlString)
                guard let image = UIImage(data: data) else { completion(.failure(.badData)); return}
                completion(.success(image))
                return
            }
        }.resume()
    }
}

