//
//  HomePage.swift
//  DishDiscovery
//
//  Created by MacBook Pro on 16/12/23.
//

import SwiftUI

struct HomePage: View {
    @State private var searchFood: String = ""
    let data = Array(1...100)
    
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack{
                    Group {
                        VStack {
                            
                            HStack {
                                
                                Text("Hello, ")
                                Spacer()
                                NavigationLink(destination: profileView()) {
                                    
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
                                NavigationLink(destination: recommView()){
                                    Text ("See All")
                                }
                            }
                            ScrollView([.horizontal]){
                                HStack {
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
                                }
                            }
                            
                            LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 2)) {
                                ForEach(data, id: \.self) { item in
                                    Text("Item \(item)")
                                        .padding()
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                }
                            }
                            .padding()
                        }
                    }
                }
                .padding()
            }
        }
    }
}
//#Preview {
//  HomePage()
//}
