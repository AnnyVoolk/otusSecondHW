//
//  RecipesViewModel.swift
//  HomeWork2
//
//  Created by Anna Volkova on 26.09.2020.
//  Copyright © 2020 Anna Volkova. All rights reserved.
//

import Foundation
import OtusNetWork

class RecipesViewModel: ObservableObject {
    
    @Published private var recipesNetWorkService: IRecipeApiService?
    
    @Published private(set) var listDataSource = [Recipe]()
    
    @Published private(set) var isPageLoadings = false
    @Published private(set) var page = 1
    
    @Published private var cashService: ICashService?
    
    private var type: RecipesSearchType
    
    init(type: RecipesSearchType) {
        self.cashService = ServiceLocator.shared.getService(type: ICashService.self)
        self.recipesNetWorkService = ServiceLocator.shared.getService(type: IRecipeApiService.self)
        self.type = type
    }
    
    func upGreatPage() {
        self.page += 1
    }
    
    func fetchPage() {
        let cashName: CashName = self.type == .fruits ? .recipeFruitPage : .recipesVegetablePage
        guard let cashPage = self.cashService?.getCashData(type: cashName) as? Int,
            cashPage >= self.page, !isPageLoadings else {
                
                self.isPageLoadings = true
                
                self.recipesNetWorkService?.getRecipe(type: type, p: page) { list, error in
                    self.isPageLoadings = false
                    if let list = list, let results = list.results {
                        self.cashService?.addCashData(data: self.page, type: cashName)
                        self.listDataSource.append(contentsOf: results)
                    }
                }
                return
        }
    }
}
