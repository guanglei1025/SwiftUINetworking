//
//  MockNetworkService.swift
//  SwiftUINetworkingTests
//
//  Created by Guanglei Liu on 11/27/24.
//

import Foundation

class MockNetworkService: RecipeNetworkServiceProtocol {
    var mockRecipes: [Recipe] = []
    var mockError: Error?

    func fetchRecipes() async throws -> [Recipe] {
        if let error = mockError {
            throw error
        }
        return mockRecipes
    }
}
