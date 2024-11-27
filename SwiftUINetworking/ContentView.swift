//
//  ContentView.swift
//  SwiftUINetworking
//
//  Created by Guanglei Liu on 11/27/24.
//

import SwiftUI

struct ContentView: View {

    private let viewModel = RecipeListViewModel()

    var body: some View {
        Group {
            if let recipes = viewModel.recipes {
                List(recipes) { recipe in
                    Text(recipe.name)
                }
            } else {
                ContentUnavailableView("No recipes available.", systemImage: "questionmark.text.page")
            }
        }
        .task {
            try? await viewModel.fetchFoods()
        }
    }
}

#Preview {
    ContentView()
}
