//
//  fPreferenceView.swift
//  DishDiscovery
//
//  Created by MacBook Pro on 18/12/23.
//

import SwiftUI


struct fPreferenceView: View {
    
    @State private var selectedPreference: String = ""
    
    
    public var foodList: [String] = [
        "Vegan",
        "Kosher",
        "Halal"
    ]
    
    var body: some View {
        NavigationStack{
            VStack{
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
}

//#Preview {
//    fPreferenceView()
//}
