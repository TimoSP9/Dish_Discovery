//
//  recommView.swift
//  DishDiscovery
//
//  Created by MacBook Pro on 21/12/23.
//

import SwiftUI

struct RecommView: View {
    let recipes: [Recipe]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 2)) {
                ForEach(recipes.shuffled().prefix(20), id: \.id) { recipe in
                    NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                        RecipeItemView(recipe: recipe)
                    }
                }
            }
            .navigationTitle("Recommended")
            .navigationBarTitleDisplayMode(.large)
            .padding()
        }
    }
}
