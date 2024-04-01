//
//  StartCoordinator.swift
//  SmallSteps
//
//  Created by T09870 on 25/02/24.
//

import UIKit

protocol StartCoordinator: Coordinator {
    
}

class StartCoordinatorImp: StartCoordinator {
    var viewController: UIViewController?
    
    var parentCoordinator: Coordinator?
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    required init(navigationCoordinator: UINavigationController, parentCoordinator: Coordinator?) {
        self.navigationController = navigationCoordinator
        self.parentCoordinator = parentCoordinator
    }
    
    func start() {
        let vc = StartViewFactory.createHostViewController(coordinator: self)
        viewController = vc
        navigationController.setViewControllers([vc], animated: false)
    }
    
    func finish() {
        viewController?.removeFromParent()
    }
    
    
}
