//
//  CashService.swift
//  HomeWork2
//
//  Created by Anna Volkova on 26.10.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation

protocol ICashService {
    
    func getCashData(type: CashName) -> Any?
    
    func addCashData(data: Any?, type: CashName)
}

class CashService: ICashService {
    
    static let shared = CashService()
    
    private init() {}
    
    private var cashedData: [String: Any] = [:]
    
    func getCashData(type: CashName) -> Any? {
        return self.cashedData[type.rawValue]
    }
    
    func addCashData(data: Any?, type: CashName) {
        let type = type.rawValue
        self.cashedData[type] = data
    }
}
