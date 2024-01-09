import SwiftUI

struct Ingredient: Hashable {
    var name: String
    var weight: String
}

struct FilterCriteria {
    var ingredientName: String?
    var ingredientWeight: String?
}

struct filterPage: View {
    @State private var filterCriteria = FilterCriteria()
    @State private var selectedIngredients: [Ingredient] = []
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

    var body: some View {
            NavigationView {
                VStack {
                    Text("Ingredient")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .bold()
                    Spacer()
                    
                    // Display selected ingredients
                    TextField("Add Ingredient Name", text: Binding(
                        get: { self.filterCriteria.ingredientName ?? "" },
                        set: { self.filterCriteria.ingredientName = $0 }
                    ))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    
                    Spacer()
                    
                    TextField("Add Ingredient Weight (gr)", text: Binding(
                        get: { self.filterCriteria.ingredientWeight ?? "" },
                        set: { self.filterCriteria.ingredientWeight = $0 }
                    ))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    Spacer()
                    
                    List(selectedIngredients, id: \.self) { ingredient in
                        Text("\(ingredient.name) - \(ingredient.weight) gr")
                    }
                    .padding()
                    HStack{
                        // Button to add ingredient to the list
                        Button("Add Ingredient") {
                            if let name = filterCriteria.ingredientName, !name.isEmpty,
                               let weight = filterCriteria.ingredientWeight, !weight.isEmpty {
                                let ingredient = Ingredient(name: name, weight: weight)
                                selectedIngredients.append(ingredient)
                                filterCriteria.ingredientName = ""
                                filterCriteria.ingredientWeight = ""
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.red)
                        
                        NavigationLink(destination: FilteredView(recipes: recipes, selectedIngredients: selectedIngredients)) {
                            Text("Apply Filter")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .foregroundColor(.red)
                                .padding()
                        }
                        .disabled(selectedIngredients.isEmpty)
                        Spacer()
                        
                    }
                }
                .padding()
                .onAppear {
                    loadRecipes()
                }
                .navigationTitle("Filter Page")
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
