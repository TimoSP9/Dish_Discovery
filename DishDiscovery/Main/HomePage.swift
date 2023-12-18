//
//  HomePage.swift
//  DishDiscovery
//
//  Created by MacBook Pro on 16/12/23.
//

import SwiftUI

struct HomePage: View {
    @State private var searchFood: String = ""
        
    var body: some View {
       
        Group {
            VStack {
                
                HStack {
                    
                    Text("Hello, ")
                    Spacer()
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 56, height: 56, alignment: .center)
                        
                }
                .padding()
                
                TextField("Search...", text: $searchFood)
                    
                    .padding()
            }
            
        }
        Spacer()
        Group{
            VStack{
                
                HStack{
                    Text("Recommendation")
                        .font(.title2)
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                            Text("See all")
                        
                    })
                    .padding()
                }
                    
                ScrollView([.horizontal]){
                    HStack  {
                        ForEach(0..<100) {
                            Text("Row \($0)")
                                .foregroundColor(.white)
                        }
                    }
                    .padding()
                }
            }
        }
        Spacer()
        
        Group{
            
            VStack{
                Text("Popular Category")
                    .padding()
                    .font(.title2)
                    .frame(maxWidth:.infinity, alignment: .leading)
                ScrollView([.horizontal]){
                    HStack{
                        Button(action: {
                            
                        }, label: {
                                Text("Breakfast")
                            
                        })
                        .padding()
                        Button(action: {
                            
                        }, label: {
                                Text("Lunch")
                            
                        })
                        .padding()
                        Button(action: {
                            
                        }, label: {
                                Text("Dinner")
                            
                        })
                        .padding()
                        Button(action: {
                            
                        }, label: {
                                Text("Appetizer")
                            
                        })
                        .padding()
                    }
                }
                Grid{
                    GridRow{
                        Text("")
                    }
                }
            }
            Spacer()
        }
    }
}

//#Preview {
//    HomePage()
//}
