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
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding()
            }
            
            Text("Food \nPreference")
                .font(.title)
                .bold()
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("Change your food preference here")
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundColor(.red)

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
                        
                    }
                }
                )
                .pickerStyle(.inline)
            }
            Button(action:{}){
                Text("Change Preference")
            }
            Spacer()
        }
    }
}

//#Preview {
//    fPreferenceView()
//}
