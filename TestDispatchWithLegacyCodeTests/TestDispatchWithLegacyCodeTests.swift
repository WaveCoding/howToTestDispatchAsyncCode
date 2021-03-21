//
//  TestDispatchWithLegacyCodeTests.swift
//  TestDispatchWithLegacyCodeTests
//
//  Created by Fabio Cuomo on 21/03/2021.
//

import XCTest
import TestDispatchWithLegacyCode

class TestDispatchWithLegacyCodeTests: XCTestCase {

    func test_viewController_viewDidLoad_showsStringFromSuccessfullyRequest() throws {
        let loader = LoaderSpy()
        let sut = ViewController(loader: loader)
        
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.label.text, "Loading...")
        
        loader.completion?("=-Loaded-=")
        XCTAssertEqual(sut.label.text, "=-Loaded-=")
    }

    // MARK: Private helpers
    private class LoaderSpy: Loader {
        var completion: ((String) -> Void)?
        
        func load(completion: @escaping (String) -> Void) {
            self.completion = completion
        }
    }
}
