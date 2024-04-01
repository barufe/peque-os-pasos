//
//  AppCoordinator.swift
//  SmallSteps
//
//  Created by T09870 on 25/02/24.
//

import UIKit

class AppCoordinatorImp:NSObject, AppCoordinator, PresentableCommonView {
   
    var viewController: UIViewController?
    
    var parentCoordinator: Coordinator?
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    var window: UIWindow?
    
    required init(navigationCoordinator navigationController: UINavigationController, parentCoordinator: Coordinator?) {
        
        self.parentCoordinator = parentCoordinator
        self.navigationController = navigationController
    }
    
    
    func start() {
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        navigationController.delegate = self
        let startCoordinator = StartCoordinatorImp(navigationCoordinator: self.navigationController, parentCoordinator: self)
        childCoordinators.append(startCoordinator)
        startCoordinator.start()
    }
    
    func finish() {
        
    }
    
    
}
// MARK:  Common View
extension AppCoordinatorImp {
    
    func presentMessageView(type: MessageViewType) {
        
    }
}


// MARK: - Loader

extension AppCoordinatorImp {
    
    func loader(isVisible:Bool) {
        if isVisible {
//            let coordinator = LoaderCoordinatorImp(navigationCoordinator: self.navigationController, parentCoordinator: self)
//            childCoordinators.append(coordinator)
//            coordinator.start()
        }else {
//            let coordinator = getChildCoordinator(LoaderCoordinator.self)
//            coordinator?.finish()
        }
        
    }
}

//MARK: UINavigationControllerDelegate
extension AppCoordinatorImp: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        interceptNavigation(parentCoordinator: self, navigationController: navigationController)
    }
}
