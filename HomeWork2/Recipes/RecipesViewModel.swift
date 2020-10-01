//
//  RecipesViewModel.swift
//  HomeWork2
//
//  Created by Anna Volkova on 26.09.2020.
//  Copyright © 2020 Anna Volkova. All rights reserved.
//

import Foundation

class RecipesViewModel: ObservableObject {
    
    @Published private(set) var listDataSource = [Recipe]()
    
    @Published private(set) var isPageLoadings = false
    @Published private(set) var page = 0
    
    private var type: RecipesSearchType
    
    init(type: RecipesSearchType) {
        self.type = type
    }
    
    func fetchPage() {
        guard isPageLoadings == false else {
            return
        }
        page += 1
        isPageLoadings = true
        
        RecipeAPI.getRecipe(i: type.searchText, p: page) { list, error in
            self.isPageLoadings = false
            if let list = list, let results = list.results {
                self.listDataSource.append(contentsOf: results)
            } else {
                print(error ?? "no error")
            }
        }
    }
}
