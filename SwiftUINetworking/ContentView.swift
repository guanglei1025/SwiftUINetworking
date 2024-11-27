//
//  ContentView.swift
//  SwiftUINetworking
//
//  Created by Guanglei Liu on 11/27/24.
//

import SwiftUI

struct ContentView: View {

    @State private var viewModel = RecipeListViewModel()

    var body: some View {
        NavigationStack {
            Group {
                if let recipes = viewModel.recipes {
                    List(recipes) { recipe in
                        RecipeRow(receipt: recipe)
                    }
                    .refreshable {
                        try? await viewModel.fetchFoods()
                    }
                } else {
                    ContentUnavailableView("No recipes available.", systemImage: "questionmark.text.page")
                }
            }
            .task {
                try? await viewModel.fetchFoods()
            }
            .navigationTitle("Recipes")
        }
    }
}

#Preview {
    ContentView()
}
