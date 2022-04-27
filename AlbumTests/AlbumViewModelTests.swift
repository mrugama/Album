//
//  AlbumViewModelTests.swift
//  AlbumTests
//
//  Created by Marlon G. Rugama on 4/26/22.
//

import XCTest
@testable import Album

class AlbumViewModelTests: XCTestCase {

    var viewModelUnderTest: AlbumViewModel!

    func testViewModelWithAlbums() throws {
        // given
        let albums = [Album(artist_name: "", album_title: "", cover_art: "")]
        viewModelUnderTest = AlbumViewModelImpl(albums: albums)

        // then
        XCTAssertNotNil(viewModelUnderTest.getAlbum(at: 0))
        XCTAssertEqual(viewModelUnderTest.getNumberOfAlbums(), 1)
    }

}
