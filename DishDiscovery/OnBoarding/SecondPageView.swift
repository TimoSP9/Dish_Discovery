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
        "Halal"
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
                print("DEBUG: \(saveData())")
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
        .navigationTitle("Start Your Journey")
    }
    func saveData(){
        UserDefaults.standard.set(self.nameText, forKey: "userName")
        UserDefaults.standard.set(true, forKey: "isOnBoardingFinish")
    }
    
}
