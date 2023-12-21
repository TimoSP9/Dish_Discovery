//
//  HomePage.swift
//  DishDiscovery
//
//  Created by MacBook Pro on 16/12/23.
//

import SwiftUI

struct HomePage: View {
    @State private var searchFood: String = ""
    @Binding var currentPage: Int
    
    var body: some View {
        NavigationStack{
            VStack{
                Group {
                    VStack {
                        
                        HStack {
                            
                            Text("Hello, ")
                            Spacer()
                            Button(action: {currentPage = 6} ){
                                Label("", systemImage:  "person.fill")
                            }
                            .frame(width: 56, height: 56, alignment: .center)
                        }
                        Section{
                            TextField("Search...", text: $searchFood)
                        }
                    }
                    
                }
                Group{
                    VStack{
                        
                        HStack{
                            Text("Recommendation")
                                .font(.title2)
                            Spacer()
                            Button(action: {currentPage = 5}, label: {
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
    }
}

//#Preview {
//    HomePage()
//}
