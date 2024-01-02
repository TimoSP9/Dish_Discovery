//
//  profileView.swift
//  DishDiscovery
//
//  Created by MacBook Pro on 18/12/23.
//

import SwiftUI


struct profileView: View {
    
    @State var SaveName = ""
    
    var body: some View {
        NavigationStack{
            ScrollView {
                HStack {
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 64, height: 64, alignment: .leading)
                        .padding()
                    Text("\(SaveName)")
                        .bold()
                }.onAppear(perform: {
                    getData()
                })
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                Spacer()
                
                VStack{
                    
                    HStack{
                        Text("What's New")
                            .frame(alignment: .leading)
                            .font(.title3)
                        Spacer()
                        NavigationLink(destination: whatNewView()) {
                            Text("Check")
                        }
                    }
                    .padding()
                    Spacer()
                    HStack{
                        Text("Food Preference")
                            .padding()
                            .frame(alignment: .leading)
                            .font(.title3)
                        Spacer()
                        NavigationLink(destination: fPreferenceView()) {
                            
                            Text("Change")
                        }
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
    func getData(){
        SaveName = "\(UserDefaults.standard.string(forKey: "userName") ?? "")"
    }
}

//#Preview {
//    profileView()
//}
