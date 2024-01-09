//
//  filteredView.swift
//  DishDiscovery
//
//  Created by MacBook Pro on 06/01/24.
//

import SwiftUI

struct FilteredView: View {
    var recipes: [Recipe]
    var selectedIngredients: [Ingredient]

    var filteredRecipes: [Recipe] {
        if selectedIngredients.isEmpty {
            return recipes
        } else {
            return recipes.filter { recipe in
                let selectedIngredientNames = selectedIngredients.map { $0.name.lowercased() }
                let selectedIngredientWeights = selectedIngredients.map { $0.weight.lowercased() }

                return selectedIngredientNames.allSatisfy { recipe.ingredients.lowercased().contains($0) } &&
                       selectedIngredientWeights.allSatisfy { recipe.ingredients.lowercased().contains($0) }
            }
        }
    }

    var body: some View {
        NavigationView {
            List(filteredRecipes) { recipe in
                NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                    HStack {
                        Image(recipe.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .cornerRadius(8)

                        Text(recipe.title)
                            .font(.headline)
                            .fontWeight(.bold)

                        Spacer()
                    }
                }
            }
            .navigationTitle("Filtered Recipes")
        }
        .onAppear {
            print("Filtered Recipes Count: \(filteredRecipes.count)")
        }
    }
}
