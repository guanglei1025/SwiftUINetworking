//
//  RecipeNetworkService.swift
//  SwiftUINetworking
//
//  Created by Guanglei Liu on 11/27/24.
//

import Foundation

class RecipeNetworkService {

    enum APIError: LocalizedError {
        case invalidURL
        case jsonParsingFailure

        var errorDescription: String? {
            switch self {
            case .invalidURL:
                "Invalid URL"
            case .jsonParsingFailure:
                "JSON parsing failure"
            }
        }
    }
    
    private let baseURL: String = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"

    func fetchRecipes() async throws -> [Recipe] {
        guard let url = URL(string: baseURL) else { throw APIError.invalidURL }
        let (data, _) = try await URLSession.shared.data(from: url)
        do {
            let payload = try JSONDecoder().decode(RecipePayload.self, from: data)
            return payload.recipes
        } catch {
            throw error
        }
    }
}
