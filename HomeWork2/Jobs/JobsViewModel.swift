//
//  JobsViewModel.swift
//  HomeWork2
//
//  Created by Anna Volkova on 28.09.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation

class JobsViewModel: ObservableObject {
    
    @Published private(set) var jobList = [Job]()
    
    @Published private(set) var isPageLoading = false
    
    @Published private(set) var page = 0
    
    func fetchJobs() {
        guard !isPageLoading else { return }
    
        isPageLoading = true
        JobsAPI.getJobs(description: "ios", page: page) { list, error in
            self.page += 1
            self.isPageLoading = false
            if let list = list {
                self.jobList.append(contentsOf: list)
            }
        }
    }
    
    func getJob(with id: String?) {
        guard let id = id else { return }
    
        JobAPI.getCurrentJob(id: id) { job, error in
            if let job = job {
                print(job)
            }
        }
    }
}
