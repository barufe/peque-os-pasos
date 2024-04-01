//
//  Coordinator.swift
//  SmallSteps
//
//  Created by T09870 on 25/02/24.
//
import UIKit

public protocol Coordinator: AnyObject {
    var viewController:UIViewController? {get}
    var parentCoordinator: Coordinator? { get set }
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    init(navigationCoordinator:UINavigationController, parentCoordinator:Coordinator?)
    func start()
    func finish()
    func didFinish()
    func backToCoordinator<T: Coordinator>(_ type: T.Type)
}
// MARK: - Coordinator Childs
public extension Coordinator {
    func didFinish() {
        parentCoordinator?.childDidFinish(self)
    }
    
    func childDidFinish(_ child: Coordinator?) {
        if let index = childCoordinators.firstIndex(where: { $0 === child }) {
            childCoordinators.remove(at: index)
        }
    }
    
    func getChildCoordinator<T>(_ : T.Type) -> T? {
        childCoordinators.filter { $0 is T }.first as? T
    }
    func backToCoordinator<T:Coordinator>(_ type: T.Type) {
        if let co = parentCoordinator?.getChildCoordinator(type.self),
            let vc = co.viewController {
            navigationController.popToViewController(vc, animated: true)
                        
            if let indexCoordinator = getIndex(type.self) {
                print(indexCoordinator)
                parentCoordinator?.childCoordinators = Array(parentCoordinator?.childCoordinators[0...indexCoordinator] ?? [])
            }
        }
    }
    func getIndex<T:Coordinator>(_ type: T.Type) -> Int? {
        return parentCoordinator?.childCoordinators.lastIndex(where: { $0 is T})
        
    }
}

// MARK: - Coordinator Common Navegation
public extension Coordinator {
    func pop(animated: Bool = true) {
        navigationController.popViewController(animated: animated)
    }
    
    func popToRoot(animated: Bool = true) {
        navigationController.popToRootViewController(animated: animated)
    }
    
    func dismiss(animated:Bool = true) {
        navigationController.presentedViewController?.dismiss(animated: animated)
    }
}

