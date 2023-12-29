//
//  filterPage.swift
//  DishDiscovery
//
//  Created by MacBook Pro on 18/12/23.
//

import SwiftUI

struct filterPage: View {
    
    @State private var showAlert = false
    
    var body: some View {
        VStack{
            Text("Ingredient")
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .bold()
            Spacer()
            Button("Add Ingredient"){
//                showAlert = true
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(.buttonBorder)
            .padding()
//            .alert(isPresented: $showAlert) {
//                Alert(
//                    title: Text("Food Preference has been change"),
//                    message: Text("Enjoy your new delicacy")
//                )
//            }
        }
    }
}


//#Preview {
//    filterPage()
//}
