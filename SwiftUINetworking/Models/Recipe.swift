//
//  Food.swift
//  SwiftUINetworking
//
//  Created by Guanglei Liu on 11/27/24.
//

struct RecipePayload: Codable {
    let recipes: [Recipe]
}

struct Recipe: Codable, Identifiable, Equatable {
    let id: String
    let name: String
    let cuisine: String
    let photoURL: String
    let sourceURL: String?
    let youtubeURL: String?

    enum CodingKeys: String, CodingKey {
        case id = "uuid"
        case name
        case cuisine
        case photoURL = "photo_url_small"
        case sourceURL = "source_url"
        case youtubeURL = "youtube_url"
    }
}

