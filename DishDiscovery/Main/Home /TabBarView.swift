//
//  TabView.swift
//  DishDiscovery
//
//  Created by MacBook Pro on 24/12/23.
//

import SwiftUI

struct TabBarView: View {
    
    @State var selectedTab = 0
    @Binding var currentPage: Int
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            HomePage()
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("Home")
                }
            Text("")
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Search")
                }
            Text("")
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("Filter")
                }
        }
    }
}