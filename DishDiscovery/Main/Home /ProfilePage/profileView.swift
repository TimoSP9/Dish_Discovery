//
//  profileView.swift
//  DishDiscovery
//
//  Created by MacBook Pro on 18/12/23.
//

import SwiftUI

struct profileView: View {
    
    var body: some View {
        ScrollView {
            VStack {
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 64, height: 64, alignment: .leading)
                    .padding()
                Text("okky")
                    .bold()
            }
            .foregroundColor(.white)
            .padding()
            
            Spacer()
            
            VStack{
                Text("Favourite")
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title2)
                Spacer()
                HStack{
                    
                }
                Spacer()
                HStack{
                    Text("Food Preference")
                        .frame(alignment: .leading)
                    Spacer()
                }
                
                .padding()
            }
            
            Spacer()
        }
    }
}

//#Preview {
//    profileView()
//}
