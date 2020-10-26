//
//  CurrentJobViewModel.swift
//  HomeWork2
//
//  Created by Anna Volkova on 01.10.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import SwiftUI

class CurrentJobViewModel: ObservableObject {
    
    @Published private var jobsNetWorkService: IJobsApiService?
    
    @Published private(set) var job: Job?
    
    @Published var isPageLoading = false
    
    @Published private var cashService: ICashService?
    
    var id: String?
    
    init() {
        self.jobsNetWorkService = ServiceLocator.shared.getService(type: IJobsApiService.self)
        self.cashService = ServiceLocator.shared.getService(type: ICashService.self)
    }
    
    func getJobDescription() {
        guard self.cashService?.getCashData(type: .currentJob) == nil, let id = self.id, !isPageLoading   else { return }
        
        self.isPageLoading = true
        self.jobsNetWorkService?.getCurrentJob(id: id) { job, error in
            self.isPageLoading = false
            if let job = job {
                self.job = job
                self.cashService?.addCashData(data: job, type: .currentJob)
            }
        }
    }
    
    func removeCashJob() {
        self.cashService?.addCashData(data: nil, type: .currentJob)
    }
}
