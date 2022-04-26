//
//  AlbumsTableViewHeader.swift
//  Album
//
//  Created by Marlon G. Rugama on 4/25/22.
//

import UIKit

class AlbumsTableViewHeader: UIView {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textAlignment = .center
        label.contentCompressionResistancePriority(for: .vertical)
        return label
    }()

    init(with titleText: String) {
        super.init(frame: .zero)
        titleLabel.text = titleText
        setupContrains()
        backgroundColor = .black.withAlphaComponent(0.7)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupContrains() {
        addSubview(titleLabel)
        NSLayoutConstraint.activate([titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16.0),
                                     titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16.0),
                                     titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)])
    }

}
