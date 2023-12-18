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
            HStack{
                Image("person.fill")
                    .resizable()
                    .frame(width: 84, height: 84, alignment: .leading)
                Text("")
                
            }
            
            Group{
                VStack{
                    Text("Favourite")
                        .padding()
                    Spacer()
                    HStack{
                        
                    }
                    Spacer()
                    HStack{
                        Text("Food Preference")
                        Spacer()
                        Button(action: {currentPage = 9}){
                            Text(">")
                        }
                    }
                }
            }
        }
    }
}

//#Preview {
//    profileView()
//}
