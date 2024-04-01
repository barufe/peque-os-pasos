//
//  ParentCoordinator.swift
//  SmallSteps
//
//  Created by T09870 on 25/02/24.
//
import UIKit

public protocol ParentCoordinator: Coordinator {

    func interceptNavigation(parentCoordinator:Coordinator, navigationController:UINavigationController)
}

public extension ParentCoordinator  {

    func interceptNavigation(
        parentCoordinator: Coordinator,
        navigationController:UINavigationController) {
        
        let newList = parentCoordinator.childCoordinators.compactMap { co in
            
            if navigationController.viewControllers.contains(where: {$0 == co.viewController}) {
                return co
            } else  {
                return nil
            }
        }
        parentCoordinator.childCoordinators = newList
        
        // print(parentCoordinator.childCoordinators.count)
         print("---COORDINATORS---")
        parentCoordinator.childCoordinators.forEach {
             print($0)
         }
         print("---VIEWCONTROLLERS---")
         navigationController.viewControllers.forEach {
             print($0)
         }
         print("-------")
    }
}
