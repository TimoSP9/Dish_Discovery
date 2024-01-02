//
//  RecipeDetailView.swift
//  DishDiscovery
//
//  Created by MacBook Pro on 02/01/24.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe

    var body: some View {
        VStack {
            Text(recipe.title)
                .font(.title)
                .padding()

            Text("Ingredients:")
                .font(.headline)
                .padding(.bottom, 4)
            Text(recipe.ingredients)
                .padding(.bottom)

            Text("Steps:")
                .font(.headline)
                .padding(.bottom, 4)
            Text(recipe.steps)
                .padding(.bottom)

            Spacer()
        }
        .navigationBarTitle(recipe.title)
    }
}

struct RecipeItemView: View {
    let recipe: Recipe

    var body: some View {
        VStack {
            Image(recipe.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100,height: 100)
                .cornerRadius(8)

            Text(recipe.title)
                .font(.caption)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}
