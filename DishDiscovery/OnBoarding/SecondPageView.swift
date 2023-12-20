//
//  SecondPageView.swift
//  DishDiscovery
//
//  Created by MacBook Pro on 15/12/23.
//

import SwiftUI

struct SecondPageView: View {
    
    @State private var nameText: String = ""
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
        NavigationStack {
            Form {
                Section("Name") {
                    TextField("Enter your name", text: $nameText)
                    
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
                            Spacer()
                            Text("Optional")
                        }
                    }
                    )
                    .pickerStyle(.inline)
                }
            }
            .background(Color(uiColor: .secondarySystemBackground))
            
            Button(action : {
                currentPage = 2
                print("DEBUG: \(nameText)")
            }){
                Text("Continue")
                
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(.buttonBorder)
            .padding()
        }
        .navigationTitle("Let's us know your taste")
    }
}
