//
//  RegisterCoordinator.swift
//  SmallSteps
//
//  Created by barufe on 3/04/24.
//

import UIKit

protocol RegisterCoordinator: Coordinator {
    func goToLogin()
}

class RegisterCoordinatorImp: RegisterCoordinator {
    
    var viewController: UIViewController?
    
    var parentCoordinator: Coordinator?
    
    var childCoordinators: [Coordinator]  = []
    
    var navigationController: UINavigationController
    
    required init(navigationCoordinator: UINavigationController, parentCoordinator: Coordinator?) {
        self.navigationController = navigationCoordinator
        self.parentCoordinator = parentCoordinator
    }
    
    func start() {
        let vc = RegisterViewFactory.createHostViewController(coordinator: self)
        viewController = vc
        navigationController.setViewControllers([vc], animated: false)
    }
    
    func finish() {
        viewController?.removeFromParent()
    }
    func goToLogin(){
        let coordinator = LoginCoordinatorImp(navigationCoordinator: self.navigationController, parentCoordinator: self.parentCoordinator)
        coordinator.start()
    }
}
