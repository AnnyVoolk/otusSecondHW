//
//  FruitsRecipes.swift
//  HomeWork2
//
//  Created by Anna Volkova on 01.10.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import SwiftUI

struct FruitsRecipes: View {
    
    @EnvironmentObject var viewModel: FruitsRecipesViewModel
    
    var body: some View {
        VStack {
            RecipesScreenList(viewModel: viewModel)
        } .onAppear() {
            self.viewModel.fetchPage()
        }
    }
}

struct FruitsRecipes_Previews: PreviewProvider {
    static var previews: some View {
        FruitsRecipes()
    }
}
