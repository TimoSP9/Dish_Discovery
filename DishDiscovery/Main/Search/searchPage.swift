//
//  searchPage.swift
//  DishDiscovery
//
//  Created by MacBook Pro on 18/12/23.
//

import SwiftUI

struct searchPage: View {
    @State private var searchText: String = ""
    @State private var recipes: [Recipe] = []
    let gambarDictionary: [String: String] = [
        "udang": "udang",
        "ikan": "ikan",
        "ayam": "ayam",
        "kambing": "kambing",
        "sapi": "sapi",
        "tempe": "tempe",
        "shrimp": "udang",
        "chicken": "ayam",
        "chiken": "ayam",
        "tuna": "ikan",
        "tongkol": "ikan",
        "lele": "ikan",
        "catfish": "ikan",
        "tenggiri": "ikan",
        "makarel": "ikan",
        "salmon": "ikan",
        "mujaer": "ikan",
        "kembung": "ikan",
        "dori": "ikan",
        "cakalang": "ikan",
        "gurameh": "ikan",
        "gabus": "ikan",
        "beef": "sapi"
    ]
    
    
    var filteredRecipes: [Recipe] {
        if searchText.isEmpty {
            return recipes
        } else {
            return recipes.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                    .padding()
                    Spacer()
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
            }
        }
        .onAppear {
            loadRecipes()
        }
    }   
    
    func loadRecipes() {
        guard let fileURL = Bundle.main.url(forResource: "resep", withExtension: "json") else {
            fatalError("Failed to locate the JSON file.")
        }
        
        do {
            let jsonData = try Data(contentsOf: fileURL)
            var loadedRecipes = try JSONDecoder().decode([Recipe].self, from: jsonData)
            
            loadedRecipes = loadedRecipes.map { recipe in
                var modifiedRecipe = recipe
                modifiedRecipe.ingredients = recipe.ingredients.replacingOccurrences(of: "--", with: "\n")
                modifiedRecipe.steps = recipe.steps.replacingOccurrences(of: "--", with: "\n")
                
                for (kataKunci, imageName) in gambarDictionary {
                    if recipe.title.localizedCaseInsensitiveContains(kataKunci) {
                        modifiedRecipe.imageName = imageName
                        break
                    }
                }
                
                return modifiedRecipe
            }
            
            recipes = loadedRecipes
        } catch {
            print("Error loading recipes: \(error.localizedDescription)")
        }
    }
}
