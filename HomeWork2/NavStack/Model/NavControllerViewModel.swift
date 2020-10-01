//
//  NavControllerViewModel.swift
//  CustomNavigationView
//
//  Created by Anna Volkova on 29.09.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import SwiftUI

final class NavControllerViewModel: ObservableObject {
    
    private let easing: Animation
    
    var navigationType = NavType.push
    
    @Published var currentScreen: Screen?
    
    private var screenStack = ScreenStack() {
        didSet {
            currentScreen = screenStack.top()
        }
    }
    
    init(easing: Animation) {
        self.easing = easing
    }
    
    func push<S: View>(_ screenView: S) {
        withAnimation(easing) {
            navigationType = .push
            let screen = Screen(id: UUID().uuidString, nextScreen: AnyView(screenView))
            screenStack.push(screen)
        }
    }
    
    func pop(to: PopDestination = .previous) {
        withAnimation(easing) {
            navigationType = .pop
            switch to {
            case .root:
                screenStack.popToRoot()
            case .previous:
                screenStack.popToPrevious()
            }
        }
    }
}
