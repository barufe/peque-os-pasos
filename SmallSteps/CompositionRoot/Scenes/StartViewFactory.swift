//
//  StartViewFactory.swift
//  SmallSteps
//
//  Created by T09870 on 25/02/24.
//

import Foundation

struct StartViewFactory: ViewSwiftUIFactory {
    
    typealias ViewType = StartView
    typealias CoordinatorType = StartCoordinator
    
    static func createView(coordinator: CoordinatorType) -> StartView {
        let viewModel = StartViewModelFactory.create()
        let view = StartView(viewmodel: viewModel, coordinator: coordinator)
        
        return view
    }
    
    static func createHostViewController(coordinator: CoordinatorType) -> GeneralHostingViewcontroller<StartView> {
        let view = createView(coordinator: coordinator)
        let hosting = GeneralHostingViewcontroller(shouldShowNavigationBar: false, rootView: view)
        return hosting
    }
    
    static func createPreview() -> StartView {
        let view = createView(coordinator: createPreviewCoordinator())
        return view
    }
    
    static func createPreviewCoordinator() -> CoordinatorType {
        return StartCoordinatorImp(navigationCoordinator: .init(), parentCoordinator: nil)
    }
    
   
   
    
    
}
