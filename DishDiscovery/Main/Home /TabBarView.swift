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
                    Image(systemName: "house.circle.fill")
                    Text("Home")
                }
            searchPage()
                .tabItem {
                    Image(systemName: "magnifyingglass.circle.fill")
                    Text("Search")
                }
            filterPage()
                .tabItem {
                    Image(systemName: "fork.knife.circle.fill")
                    Text("Filter")
                }
        }
    }
}
