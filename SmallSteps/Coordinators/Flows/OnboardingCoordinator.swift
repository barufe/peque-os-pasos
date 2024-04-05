//
//  StartCoordinator.swift
//  SmallSteps
//
//  Created by T09870 on 25/02/24.
//

import UIKit

protocol OnboardingCoordinator: Coordinator {
    func goToLogin()
    func goToRegister()
}

class OnboardingCoordinatorImp: OnboardingCoordinator {
    
    
   
    var viewController: UIViewController?
    
    var parentCoordinator: Coordinator?
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    required init(navigationCoordinator: UINavigationController, parentCoordinator: Coordinator?) {
        self.navigationController = navigationCoordinator
        self.parentCoordinator = parentCoordinator
    }
    
    func start() {
        let vc = OnboardingViewFactory.createHostViewController(coordinator: self)
        viewController = vc
        navigationController.setViewControllers([vc], animated: false)
    }
    
    func finish() {
        viewController?.removeFromParent()
    }
    
    func goToLogin() {
        let coordinator = LoginCoordinatorImp(navigationCoordinator: self.navigationController, parentCoordinator: self.parentCoordinator)
        coordinator.start()
    }
    
    func goToRegister() {
        let coordinator = RegisterCoordinatorImp(navigationCoordinator: self.navigationController, parentCoordinator: self.parentCoordinator)
        coordinator.start()
    }
}
