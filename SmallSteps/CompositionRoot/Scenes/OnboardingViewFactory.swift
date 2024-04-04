//
//  OnboardingViewFactory.swift
//  SmallSteps
//
//  Created by T09870 on 25/02/24.
//

import Foundation

struct OnboardingViewFactory: ViewSwiftUIFactory {
    
    typealias ViewType = OnboardingView
    typealias CoordinatorType = OnboardingCoordinator
    
    static func createView(coordinator: CoordinatorType) -> OnboardingView {
        let viewModel = OnboardingViewModelFactory.create()
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
        return OnboardingCoordinatorImp(navigationCoordinator: .init(), parentCoordinator: nil)
    }
    
   
   
    
    
}
