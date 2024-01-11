//
//  fPreferenceView.swift
//  DishDiscovery
//
//  Created by MacBook Pro on 18/12/23.
//

import SwiftUI


struct fPreferenceView: View {
    
    @State private var selectedPreference: String = ""
    @State private var showAlert = false
    
    
    public var foodList: [String] = [
        "Kosher",
        "Halal"
    ]
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("Change your food preference here")
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.red)
                    .padding(.horizontal)
                
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
                Button("Change Preference"){
                    showAlert = true
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Food Preference has been change"),
                        message: Text("Enjoy your new delicacy")
                    )
                }
            }
            .navigationTitle("My Preference")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}


//#Preview {
//    fPreferenceView()
//}
