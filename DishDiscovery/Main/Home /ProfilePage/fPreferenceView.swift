//
//  fPreferenceView.swift
//  DishDiscovery
//
//  Created by MacBook Pro on 18/12/23.
//

import SwiftUI


struct fPreferenceView: View {
    
    @State private var selectedPreference: String = ""
    @Binding var currentPage : Int
    
    public var foodList: [String] = [
        "Vegan",
        "Kosher",
        "Halal",
        "Gluten-Free",
        "Daily-Free"
    ]
    
    var body: some View {
        VStack{
            Button(action: {currentPage = 6 }){
                Text("<")
            }
            Spacer()
            Text("Food \nPreference")
                .font(.title)
                .padding()
            Text("Change your food preference here")
            Spacer()
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
        }
    }
}

//#Preview {
//    fPreferenceView()
//}
