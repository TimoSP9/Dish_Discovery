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
            Text("Let's us know your taste")
                .font(.title2)
                .fontWeight(.semibold)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            Form {
                Section("Name") {
                    TextField("Enter your name", text: $searchText)
                    
                }
                List{
                    Picker(selection: $selectedPreference, content:
                            {ForEach(foodList, id: \.self) { planet in
                        Text(planet)
                    }}, label: {
                        HStack{
                            Text("Food Preference")
                            Text("Optional")
                        }
                    })
                    .pickerStyle(.inline)
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            Button(action : {
                currentPage = 2
            }){
                Text("Continue")
                
            }
            .font(.title2)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.red)
            .foregroundStyle(Color.primary)
            .clipShape(.buttonBorder)
        }
        .padding(.horizontal, 40)
        .padding(.vertical, 40)
    }
}
//
//#Preview {
//    SecondPageView(currentPage: Binding<Int>)
//}
