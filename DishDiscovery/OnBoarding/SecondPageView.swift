//
//  SecondPageView.swift
//  DishDiscovery
//
//  Created by MacBook Pro on 15/12/23.
//

import SwiftUI

struct SecondPageView: View {
    
    @State private var searchText: String = ""
    @State private var selectedPreference: String = ""
    @Binding var currentPage: Int
    public var foodList: [String] = [
        "Vegan",
        "Kosher",
        "Halal",
        "Gluten-Free",
        "Daily-Free"
    ]
    
    var body: some View {
        NavigationStack{
            Form {
                Section("Name") {
                    TextField("Enter your name", text: $searchText)
                    
                }
                List{
                    Picker(selection: $selectedPreference, content:
                            {
                        
                        ForEach(foodList, id: \.self) { planet in
                            Text(planet)
                        }
                    }, label: {
                        HStack {
                            Text("Food Preference")
                            Text("Optional")
                        }
                    }
                    )
                    .pickerStyle(.inline)
                }
                
                Button(action : {
                    currentPage = 2
                }){
                    Text("Continue")
                    
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .clipShape(.buttonBorder)
            }
        }
        .navigationTitle("Let's us know your taste")
    }
}
