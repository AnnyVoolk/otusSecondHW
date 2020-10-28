//
//  JobsViewModel.swift
//  HomeWork2
//
//  Created by Anna Volkova on 28.09.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation
import OtusNetWork
import OtusCore

class JobsViewModel: ObservableObject {
    
    @Published private var jobsNetWorkService: IJobsApiService?
    
    @Published private(set) var jobList = [Job]()
    
    @Published private(set) var isPageLoading = false
    
    @Published private(set) var page = 0
    
    @Published private var cashService: ICashService?
    
    init() {
        self.jobsNetWorkService = ServiceLocator.shared.getService(type: IJobsApiService.self)
        self.cashService = ServiceLocator.shared.getService(type: ICashService.self)
    }
    
    func upGreatPage() {
        self.page += 1
    }
    
    func fetchJobs() {
        guard let cashPage = self.cashService?.getCashData(type: .jobsPage) as? Int,
            cashPage >= self.page, !isPageLoading else {
                
                isPageLoading = true
                self.jobsNetWorkService?.getJobs(description: "ios", page: self.page) { list, error in
                    self.isPageLoading = false
                    if let list = list {
                        self.cashService?.addCashData(data: self.page, type: .jobsPage)
                        self.jobList.append(contentsOf: list)
                    }
                }
                return
        }
    }
}
