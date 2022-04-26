//
//  ViewController.swift
//  Album
//
//  Created by Marlon G. Rugama on 4/22/22.
//

import UIKit

class AlbumsViewController: UITableViewController {

    private var albumViewModel: AlbumViewModel {
        didSet {
            self.tableView.reloadData()
        }
    }
    let kTableviewIdentifier = "Album Cell"

    init(albumVM: AlbumViewModel) {
        self.albumViewModel = albumVM
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.barStyle = .black
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Status bar height is needed to avoid underlap tableview cells
        let statusBarHeight = getStatusBarHeight()
        print(statusBarHeight)
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    private func setupViews() {
        tableView.backgroundColor = .black.withAlphaComponent(0.7)
        tableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: kTableviewIdentifier)
    }

    // mark: - helpder method
    private func getStatusBarHeight() -> CGFloat {
        var statusBarHeight: CGFloat = 0
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        return statusBarHeight
    }

}

// mark: - UITableViewDelegate
extension AlbumsViewController {
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return AlbumsTableViewHeader(with: "Albums")
    }
}

// mark: - UITableViewDatasource
extension AlbumsViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumViewModel.getNumberOfAlbums()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: kTableviewIdentifier,
                                                         for: indexPath) as? AlbumTableViewCell
        else {
            return UITableViewCell()
        }

        let album = albumViewModel.getAlbum(at: indexPath.row)
        cell.updateAlbumCell(with: album)
        return cell
    }
}

