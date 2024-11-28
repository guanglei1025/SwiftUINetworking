//
//  RecipeNetworkServiceProtocol.swift
//  SwiftUINetworking
//
//  Created by Guanglei Liu on 11/27/24.
//

protocol RecipeNetworkServiceProtocol {
    func fetchRecipes() async throws -> [Recipe]
}
