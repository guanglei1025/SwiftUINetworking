//
//  FoodListViewModel.swift
//  SwiftUINetworking
//
//  Created by Guanglei Liu on 11/27/24.
//

import Foundation
import SwiftUI

@Observable
class RecipeListViewModel {
    var foods: [Recipe]?

    func fetchFoods() async throws {
        self.foods = [
            Recipe(id: 1, name: "A", description: "Description For A"),
            Recipe(id: 2, name: "B", description: "Description For B"),
            Recipe(id: 3, name: "C", description: "Description For C")
        ]
    }
}
