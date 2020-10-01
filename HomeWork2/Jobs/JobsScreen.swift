//
//  JobsScreen.swift
//  HomeWork2
//
//  Created by Anna Volkova on 28.09.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import SwiftUI

struct JobsScreen: View {
    
    @EnvironmentObject var viewModel: JobsViewModel
    
    var body: some View {
        VStack {
            JobsScreenList(viewModel: viewModel)
        } .onAppear() {
            self.viewModel.fetchJobs()
        }
    }
}

struct JobsScreen_Previews: PreviewProvider {
    static var previews: some View {
        JobsScreen()
    }
}
