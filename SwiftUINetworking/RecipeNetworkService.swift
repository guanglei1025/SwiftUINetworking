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
        case jsonParsingFailure(reason: String)
        case networkError(Error)

        var errorDescription: String? {
            switch self {
            case .invalidURL:
                return "The URL is invalid."
            case .jsonParsingFailure(let reason):
                return "Failed to parse the JSON response: \(reason)"
            case .networkError(let error):
                return "Network error occurred: \(error.localizedDescription)"
            }
        }
    }

    private let baseURL: String = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"

    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func fetchRecipes() async throws -> [Recipe] {
        guard let url = URL(string: baseURL) else { throw APIError.invalidURL }
        let (data, _) = try await session.data(from: url)
        do {
            let payload = try JSONDecoder().decode(RecipePayload.self, from: data)
            return payload.recipes
        } catch {
            throw APIError.jsonParsingFailure(reason: error.localizedDescription)
        }
    }
}
