//
//  ServiceLocator.swift
//  HomeWork2
//
//  Created by Anna Volkova on 26.10.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation

protocol IServiceLocator {
    
    func getService<T>(type: T.Type) -> T?
    
    func addService<T>(service: T)
}

class ServiceLocator: IServiceLocator {
    
    static let shared = ServiceLocator()
    
    private init() {}
    
    private var services: [String: Any] = [:]
    
    func getService<T>(type: T.Type) -> T? {
        return self.services[String(describing: type)] as? T
    }
    
    func addService<T>(service: T) {
        let type = String(describing: T.self)
        if self.services[type] == nil {
            self.services[type] = service
        }
    }
}
