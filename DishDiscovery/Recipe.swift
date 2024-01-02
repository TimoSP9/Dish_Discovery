//
//  Recipe.swift
//  DishDiscovery
//
//  Created by MacBook Pro on 02/01/24.
//

import Foundation

struct Recipe: Decodable, Identifiable {
    let id = UUID()
    let title: String
    var ingredients: String
    var steps: String
    var imageName: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case ingredients = "Ingredients"
        case steps = "Steps"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        ingredients = try container.decode(String.self, forKey: .ingredients)
        steps = try container.decode(String.self, forKey: .steps)
        imageName = ""
    }
}
