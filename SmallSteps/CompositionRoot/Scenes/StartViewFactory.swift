//
//  StartViewFactory.swift
//  SmallSteps
//
//  Created by T09870 on 25/02/24.
//

import Foundation

struct StartViewFactory: ViewSwiftUIFactory {
    
    typealias ViewType = OnboardingView
    typealias CoordinatorType = StartCoordinator
    
    static func createView(coordinator: CoordinatorType) -> OnboardingView {
        let viewModel = StartViewModelFactory.create()
        let view = OnboardingView(viewmodel: viewModel, coordinator: coordinator)
        
        return view
    }
    
    static func createHostViewController(coordinator: CoordinatorType) -> GeneralHostingViewcontroller<OnboardingView> {
        let view = createView(coordinator: coordinator)
        let hosting = GeneralHostingViewcontroller(shouldShowNavigationBar: false, rootView: view)
        return hosting
    }
    
    static func createPreview() -> OnboardingView {
        let view = createView(coordinator: createPreviewCoordinator())
        return view
    }
    
    static func createPreviewCoordinator() -> CoordinatorType {
        return StartCoordinatorImp(navigationCoordinator: .init(), parentCoordinator: nil)
    }
    
   
   
    
    
}
