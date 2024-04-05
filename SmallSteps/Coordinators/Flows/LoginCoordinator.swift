//
//  LoginCoordinator.swift
//  SmallSteps
//
//  Created by barufe on 1/04/24.
//

import UIKit

protocol LoginCoordinator: Coordinator {
    func goToRegister()
}

class LoginCoordinatorImp: LoginCoordinator {
    
    var viewController: UIViewController?
    
    var parentCoordinator: Coordinator?
    
    var childCoordinators: [Coordinator]  = []
    
    var navigationController: UINavigationController
    
    required init(navigationCoordinator: UINavigationController, parentCoordinator: Coordinator?) {
        self.navigationController = navigationCoordinator
        self.parentCoordinator = parentCoordinator
    }
    
    func start() {
        let vc = LoginViewFactory.createHostViewController(coordinator: self)
        viewController = vc
        navigationController.setViewControllers([vc], animated: false)
    }
    
    func finish() {
        viewController?.removeFromParent()
    }
    func goToRegister() {
        let coordinator = RegisterCoordinatorImp(navigationCoordinator: self.navigationController, parentCoordinator: self.parentCoordinator)
        coordinator.start()
    }
}
