//
//  HomePage.swift
//  DishDiscovery
//
//  Created by MacBook Pro on 16/12/23.
//

import SwiftUI


struct HomePage: View {
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
    
    @State var SaveName = ""
    let data = Array(1...100)
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Group {
                        VStack {
                            HStack {
                                Text("\(SaveName)")
                                    .font(.title3)
                                Spacer()
                                NavigationLink(destination: profileView()) {
                                    Label("", systemImage:  "person.fill")
                                }
                                .frame(width: 56, height: 56, alignment: .center)
                            }
                        }
                    }
                    Spacer()
                    Group {
                        VStack {
                            HStack {
                                Text("Recommendation")
                                    .font(.title2)
                                Spacer()
                                NavigationLink(destination: RecommView(recipes: recipes)) {
                                    Text("See All")
                                }
                            }
                            ScrollView([.horizontal]) {
                                LazyHStack {
                                    ForEach(recipes.prefix(10), id: \.id) { recipe in
                                        NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                                            RecipeItemView(recipe: recipe)
                                        }
                                    }
                                }
                                .padding()
                            }
                        }
                    }
                    Spacer()
                    Group {
                        VStack {
                            Text("Popular Category")
                                .font(.title2)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Spacer()
                            LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 2)) {
                                ForEach(recipes.prefix(50), id: \.id) { recipe in
                                    NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                                        RecipeItemView(recipe: recipe)
                                    }
                                }
                            }
                            .padding()
                        }
                    }
                }
                .padding()
            }
            .onAppear {
                loadRecipes()
                getData()
            }
            .navigationTitle("Recipes")
        }
    }
    
    func getData(){
        SaveName = "Hello, \(UserDefaults.standard.string(forKey: "userName") ?? "")"
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



//#Preview {
//  HomePage()
//}
