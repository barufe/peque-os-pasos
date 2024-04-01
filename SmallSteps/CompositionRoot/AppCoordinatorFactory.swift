//
//  AppCoordinatorFactory.swift
//  SmallSteps
//
//  Created by T09870 on 25/02/24.
//

import UIKit

struct  AppCoordinatorFactory {
    
    static func createAppCoordinator(window: UIWindow) -> AppCoordinator {
        let coordinator = AppCoordinatorImp(navigationCoordinator: createNavigator(), parentCoordinator: nil)
        coordinator.window = window
        return coordinator
    }
    
    static func createNavigator() -> UINavigationController {
        return UINavigationController()
    }
}
