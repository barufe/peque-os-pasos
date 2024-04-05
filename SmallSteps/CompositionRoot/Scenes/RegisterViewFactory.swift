//
//  RegisterViewFactory.swift
//  SmallSteps
//
//  Created by barufe on 3/04/24.
//

import Foundation

struct RegisterViewFactory: ViewSwiftUIFactory {
    
    typealias ViewType = RegisterView
    typealias CoordinatorType = RegisterCoordinator
    
    static func createView(coordinator: CoordinatorType) -> RegisterView {
        let viewModel = RegisterViewModelFactory.create()
        let view = RegisterView(viewModel: viewModel, coordinator: coordinator)
        
        return view
    }
    
    static func createHostViewController(coordinator: CoordinatorType) -> GeneralHostingViewcontroller<RegisterView> {
        let view = createView(coordinator: coordinator)
        let hosting = GeneralHostingViewcontroller(shouldShowNavigationBar: false, rootView: view)
        return hosting
    }
    
    static func createPreview() -> RegisterView {
        let view = createView(coordinator: createPreviewCoordinator())
        return view
    }
    
    static func createPreviewCoordinator() -> CoordinatorType {
        return RegisterCoordinatorImp(navigationCoordinator: .init(), parentCoordinator: nil)
    }
}
