//
//  SwiftUINetworkingTests.swift
//  SwiftUINetworkingTests
//
//  Created by Guanglei Liu on 11/27/24.
//

import XCTest

final class SwiftUINetworkingTests: XCTestCase {

    var viewModel: RecipeListViewModel!
    var mockNetworkService: MockNetworkService!

    override func setUpWithError() throws {
        mockNetworkService = MockNetworkService()
        viewModel = RecipeListViewModel(networkService: mockNetworkService)
    }

    override func tearDownWithError() throws {
        viewModel = nil
        mockNetworkService = nil
    }

    func testFetchFoods_Success() async {
        let mockRecipes = [
            Recipe(id: "eed6005f-f8c8-451f-98d0-4088e2b40eb6",
                   name: "Bakewell Tart",
                   cuisine: "British",
                   photoURL: "https://some.url/small.jpg",
                   sourceURL: "https://some.url/index.html",
                   youtubeURL: "https://www.youtube.com/watch?v=some.id")
        ]
        mockNetworkService.mockRecipes = mockRecipes

        await viewModel.fetchFoods()

        XCTAssertEqual(viewModel.recipes, mockRecipes)
        XCTAssertNil(viewModel.errorMessage)
    }

    func testFetchFoods_Failure() async {
        let mockError = NSError(domain: "Mock Error", code: 400, userInfo: [NSLocalizedDescriptionKey: "Bad Request"])
        mockNetworkService.mockError = mockError

        await viewModel.fetchFoods()

        XCTAssertTrue(viewModel.recipes.isEmpty)
        XCTAssertEqual(viewModel.errorMessage, mockError.localizedDescription)
    }
}
