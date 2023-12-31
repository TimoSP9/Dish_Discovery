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
        ScrollView {
            VStack(spacing: 24) {
                Text(recipe.title)
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(spacing: 4) {
                    Text("Ingredients:")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(recipe.ingredients)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                VStack(spacing: 4) {
                    Text("Steps:")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(recipe.steps)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
        }
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


struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .padding(8)
                .background(Color(.systemGray5))
                .cornerRadius(8)
            
            Button(action: {
                text = ""
            }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.gray)
                    .padding(8)
            }
            .opacity(text.isEmpty ? 0 : 1)
        }
    }
}
