//
//  SceneDelegate.swift
//  SmallSteps
//
//  Created by T09870 on 25/02/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        setupAppCoordinator(windowScene: windowScene)
        
    }
    
    func setupAppCoordinator(windowScene:UIWindowScene) {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.windowScene = windowScene
        self.window = window
        
        let appcoordinator = AppCoordinatorFactory.createAppCoordinator(
            window: window)
        
        appcoordinator.start()
    }
}

