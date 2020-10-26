//
//  AppConfig.swift
//  HomeWork2
//
//  Created by Anna Volkova on 26.10.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation

class AppConfig {
    
    static let shared = AppConfig()
    
    private init() {
        self.setup()
    }
    
    private func setup() {
        ServiceLocator.shared.addService(service: CashService.shared as ICashService)
        ServiceLocator.shared.addService(service: JobsAPI() as IJobsApiService)
        ServiceLocator.shared.addService(service: RecipeAPI() as IRecipeApiService)
    }
}
