//
//  VegetablesRecipes.swift
//  HomeWork2
//
//  Created by Anna Volkova on 01.10.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import SwiftUI

struct VegetablesRecipes: View {
    
    @EnvironmentObject var viewModel: VegetablesRecipesViewModel
    
    var body: some View {
        VStack {
            RecipesScreenList(viewModel: viewModel)
        } .onAppear() {
            self.viewModel.fetchPage()
        }
    }
}

struct VegetablesRecipes_Previews: PreviewProvider {
    static var previews: some View {
        VegetablesRecipes()
    }
}
