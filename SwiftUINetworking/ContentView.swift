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
            List(viewModel.recipes) { recipe in
                RecipeRow(receipt: recipe)
            }
            .refreshable {
                await viewModel.fetchFoods()
            }
            .overlay {
                if let errorMessage = viewModel.errorMessage {
                    ContentUnavailableView {
                        Label("Unable to load recipes", systemImage: "questionmark.text.page")
                    } description: {
                        Text(errorMessage)
                    } actions: {
                        Button("Retry") {
                            Task {
                                await viewModel.fetchFoods()
                            }
                        }
                    }
                } else if viewModel.recipes.isEmpty {
                    ContentUnavailableView("Recipes list is empty", systemImage: "questionmark.text.page")
                }
            }
            .task {
                await viewModel.fetchFoods()
            }
            .navigationTitle("Recipes")
        }
    }
}

#Preview {
    ContentView()
}
