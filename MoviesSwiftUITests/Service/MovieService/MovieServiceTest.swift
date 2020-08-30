//
//  MovieServiceTest.swift
//  MoviesSwiftUITests
//
//  Created by Veli on 30.08.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import XCTest

@testable import MoviesSwiftUI

class MoviesServiceTest: XCTestCase {

    private let movieService: MoiveMockService = MoiveMockService()
    let timeout: TimeInterval = 20.0

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetAllMovies() throws {
        let expectation = self.expectation(description: "result")


        movieService.getAllItems(pageIndex: 1, onSuccess: { (items) in
            expectation.fulfill()
        }) { (error) in
            expectation.fulfill()
        }  


        wait(for: [expectation], timeout: timeout)
    }

    
    func testGetAllSearchValues() throws {
        let expectation = self.expectation(description: "result")


        movieService.getAllTermItems(pageIndex: 1,term:"avatar", onSuccess: { (items) in
            expectation.fulfill()
        }) { (error) in
            expectation.fulfill()
        }


        wait(for: [expectation], timeout: timeout)
    }


}
