//
//  DishDiscoveryApp.swift
//  DishDiscovery
//
//  Created by MacBook Pro on 03/12/23.
//

import SwiftUI

@main
struct DishDiscoveryApp: App {
    var body: some Scene {
        WindowGroup {
            HomePage()
                .environment(\.colorScheme, .dark)
        }
    }
}
