//
//  RecipeScreen.swift
//  HomeWork2
//
//  Created by Anna Volkova on 26.09.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import SwiftUI

struct RecipesScreenList: View {
    
    @ObservedObject var viewModel: RecipesViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.listDataSource) { recipe in
                RecipeScreenRecipeCell(title: recipe.titleTrimmed, description: recipe.ingredients ?? "") .onAppear() {
                    if self.viewModel.listDataSource.isLast(recipe) {
                        self.viewModel.upGreatPage()
                        self.viewModel.fetchPage()
                    }
                }
            }
            if viewModel.isPageLoadings {
                ActivityIndicatorView(style: .medium)
                    .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
            }
        }
    }
}
