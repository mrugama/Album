//
//  AlbumTests.swift
//  AlbumTests
//
//  Created by Marlon G. Rugama on 4/22/22.
//

import XCTest
@testable import Album

class AlbumDataLoaderTests: XCTestCase {

    var dataLoaderUnderTest: AlbumDataLoader!

    override func setUpWithError() throws {
        dataLoaderUnderTest = AlbumDataLoader()
    }

    func testAlbumDataLoaded() throws {
        // when
        dataLoaderUnderTest.loadAlbums { result in
            switch result {
            case .success(let albums):
                XCTAssertTrue(!albums.isEmpty)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            dataLoaderUnderTest.loadAlbums { result in
                switch result {
                case .success(let albums):
                    XCTAssertTrue(!albums.isEmpty)
                case .failure(let error):
                    XCTFail(error.localizedDescription)
                }
            }
        }
    }

}
