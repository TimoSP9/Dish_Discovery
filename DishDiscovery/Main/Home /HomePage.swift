//
//  HomePage.swift
//  DishDiscovery
//
//  Created by MacBook Pro on 16/12/23.
//

import SwiftUI

struct HomePage: View {
    
    @State var SaveName = ""
    let data = Array(1...100)
    
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack{
                    Group {
                        VStack {
                            
                            HStack {
                                
                                Text("\(SaveName)")
                                    .font(.title3)
                                Spacer()
                                NavigationLink(destination: profileView()) {
                                    
                                    Label("", systemImage:  "person.fill")
                                }
                                .frame(width: 56, height: 56, alignment: .center)
                            }
                        }
                    }
                    Spacer()
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
                            Spacer()
                                HStack{
                                    Spacer()
                                    Button(action: {
                                    }, label: {
                                        Text("Breakfast")
                                    })
                                    Spacer()
                                    Button(action: {
                                    }, label: {
                                        Text("Lunch")
                                    })
                                    Spacer()
                                    Button(action: {
                                        
                                    }, label: {
                                        Text("Dinner")
                                    })
                                    Spacer()
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
                }.onAppear(perform: {
                    getData()
                })
                .padding()
            }
        }
    }
    func getData(){
        SaveName = "Hello, \(UserDefaults.standard.string(forKey: "userName") ?? "")"
    }
}
//#Preview {
//  HomePage()
//}
