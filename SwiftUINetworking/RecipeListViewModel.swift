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

    var recipes = [Recipe]()

    var errorMessage: String?

    private let networkService = RecipeNetworkService()

    private var isLoading: Bool = false

    func fetchFoods() async {
        guard isLoading == false else { return }
        isLoading = true
        defer {
            isLoading = false
        }
        do {
            recipes = try await networkService.fetchRecipes()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
