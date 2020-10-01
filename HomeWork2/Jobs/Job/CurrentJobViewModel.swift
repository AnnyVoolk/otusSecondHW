//
//  CurrentJobViewModel.swift
//  HomeWork2
//
//  Created by Anna Volkova on 01.10.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import SwiftUI

class CurrentJobViewModel: ObservableObject {
    
    @Published private(set) var job: Job?
    
    @Published var isPageLoading = false
    
    var id: String?
    
    func getJobDescription() {
        guard let id = self.id else { return }
    
        self.isPageLoading = true
        JobAPI.getCurrentJob(id: id) { job, error in
            self.isPageLoading = false
            if let job = job {
                self.job = job
            }
        }
    }
}
