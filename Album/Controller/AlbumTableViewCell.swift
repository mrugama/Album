//
//  AlbumTableViewCell.swift
//  Album
//
//  Created by Marlon G. Rugama on 4/23/22.
//

import Foundation
import UIKit

class AlbumTableViewCell: UITableViewCell {

    private var album: Album!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
    }

    public func updateAlbumCell(with album: Album) {
        self.album = album
        updateCellTheme()

        textLabel?.text = album.album_title
        detailTextLabel?.text = album.artist_name
        ImageLoader.loadImage(from: album.cover_art) { [weak self] result in
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    self?.imageView?.image = image
                    self?.setNeedsLayout()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    private func updateCellTheme() {
        backgroundColor = .black
        textLabel?.textColor = .white
        detailTextLabel?.textColor = .lightGray
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        imageView?.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        imageView?.contentMode = .scaleAspectFit
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
