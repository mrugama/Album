//
//  ImageLoaderTests.swift
//  AlbumTests
//
//  Created by Marlon G. Rugama on 4/26/22.
//

import XCTest
@testable import Album

class ImageLoaderTests: XCTestCase {

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWhenValidImageURL() throws {
        // given
        let imageURL = "https://i.imgur.com/V6ubHJA.jpg"
        // when
        ImageLoader.loadImage(from: imageURL) { result in
            switch result {
            case .success(let image):
                XCTAssertNotNil(image)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
    }

    func testWhenInvalidImageURL() throws {
        // given
        let imageURL = "254542"
        // when
        ImageLoader.loadImage(from: imageURL) { result in
            switch result {
            case .success(_):
                XCTFail()
            case .failure(let error):
                XCTAssertNotNil(error)
            }
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // given
            let imageURL = "https://i.imgur.com/V6ubHJA.jpg"
            // when
            ImageLoader.loadImage(from: imageURL) { result in
                switch result {
                case .success(let image):
                    XCTAssertNotNil(image)
                case .failure(let error):
                    XCTFail(error.localizedDescription)
                }
            }
        }
    }

}
