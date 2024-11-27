//
//  FoodListViewModel.swift
//  SwiftUINetworking
//
//  Created by Guanglei Liu on 11/27/24.
//

import Foundation
import SwiftUI
import Observation

@Observable
class RecipeListViewModel {

    var recipes: [Recipe]?

    private let networkService = RecipeNetworkService()

    func fetchFoods() async throws {
        recipes = try await networkService.fetchRecipes()
    }
}
