//
//  profileView.swift
//  DishDiscovery
//
//  Created by MacBook Pro on 18/12/23.
//

import SwiftUI

struct profileView: View {
    @Binding var currentPage : Int
    var body: some View {
        VStack{
            
            Group{
                HStack{
                    Button(action: {}){
                        Text("<")
                    }
                    .padding()
                    Image("person.fill")
                        .resizable()
                        .frame(width: 84, height: 84, alignment: .leading)
                        .padding()
                        .foregroundColor(.white)
                    
                    Text("okky")
                        .bold()
                        
                }
            }
            Spacer()
            Group{
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
                        Button(action: {currentPage = 9}){
                            Text(">")
                        }
                        .padding()
                    }
                }
            }
            Spacer()
        }
    }
}

//#Preview {
//    profileView()
//}
