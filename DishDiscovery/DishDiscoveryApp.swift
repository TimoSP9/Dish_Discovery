//
//  DishDiscoveryApp.swift
//  DishDiscovery
//
//  Created by MacBook Pro on 03/12/23.
//

import SwiftUI

@main
struct DishDiscoveryApp: App {
    
    @State private var currentPage: Int = 0
    
        var body: some Scene {
        WindowGroup {
            HomePage(currentPage: $currentPage)
                .environment(\.colorScheme, .dark)
        }
    }
}
