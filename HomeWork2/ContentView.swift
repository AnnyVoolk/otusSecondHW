//
//  ContentView.swift
//  HomeWork2
//
//  Created by mac on 17.09.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rubricSelection = 0
    var rubrics = ["IOS jobs", "Vegetable pecipes", "Fuits recipes"]

    var body: some View {
        NavControllerView(transition: .custom(push: .move(edge: .trailing), pop: .slide))  {
            VStack() {
                Picker("Options", selection:  self.$rubricSelection) {
                    ForEach(0 ..< self.rubrics.count) { index in
                        Text(self.rubrics[index]).tag(index)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
                if self.rubricSelection == 0 {
                    JobsScreen()
                } else if self.rubricSelection == 1 {
                    VegetablesRecipes()
                } else {
                    FruitsRecipes()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
