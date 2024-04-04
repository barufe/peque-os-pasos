//
//  LoginViewFactory.swift
//  SmallSteps
//
//  Created by barufe on 1/04/24.
//

import Foundation

struct LoginViewFactory: ViewSwiftUIFactory {
    
    typealias ViewType = LoginView
    typealias CoordinatorType = LoginCoordinator
    
    static func createView(coordinator: CoordinatorType) -> LoginView {
        let viewModel = LoginViewModelFactory.create()
        let view = LoginView(viewModel: viewModel, coordinator: coordinator)
        
        return view
    }
    
    static func createHostViewController(coordinator: CoordinatorType) -> GeneralHostingViewcontroller<LoginView> {
        let view = createView(coordinator: coordinator)
        let hosting = GeneralHostingViewcontroller(shouldShowNavigationBar: false, rootView: view)
        return hosting
    }
    
    static func createPreview() -> LoginView {
        let view = createView(coordinator: createPreviewCoordinator())
        return view
    }
    
    static func createPreviewCoordinator() -> CoordinatorType {
        return LoginCoordinatorImp(navigationCoordinator: .init(), parentCoordinator: nil)
    }
}
