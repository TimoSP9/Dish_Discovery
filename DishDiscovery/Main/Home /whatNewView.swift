//
//  whatNewView.swift
//  DishDiscovery
//
//  Created by MacBook Pro on 18/12/23.
//

import SwiftUI

struct whatNewView: View {
    var body: some View {
        VStack{
            Text("What's New")
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding()
            Text("The latest release recipe that you can follow")
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .bottomLeading)
                .font(.title3)
                .padding()
            Spacer()
            ScrollView([.horizontal]){
                HStack{
                    Button(action:{} , label: {Text( "Vegan")})
                        .padding()
                    Button(action:{} , label: {Text( "Gluten")})
                        .padding()
                    Button(action:{} , label: {Text( "Halal")})
                        .padding()
                    Button(action:{} , label: {Text( "Diet")})
                        .padding()
                    Button(action:{} , label: {Text( "Kosher")})
                        .padding()
                }
                .font(.title3)
                Spacer()
            }
            Text("New")
                .font(.title2)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            Spacer()
//            VStack{
//                HStack{
//                    Image()
//                        .padding()
//                    Text()
//                        .font(.caption2)
//                }
//            }
            
        }
    }
}

//#Preview {
//    whatNewView()
//}
