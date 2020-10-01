//
//  RecipeSearchType.swift
//  HomeWork2
//
//  Created by Anna Volkova on 01.10.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation

enum RecipesSearchType {
    
    case vegetables
    case fruits
    
    var searchText: String {
        switch self {
        case .fruits:
            return "apple, orange, banana"
        case .vegetables:
            return "tomato, cucumber, potatoes"
        }
    }
}
