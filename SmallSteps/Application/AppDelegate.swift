//
//  AppDelegate.swift
//  SmallSteps
//
//  Created by T09870 on 25/02/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        startApp()
        return true	
    }
    
    
    func startApp() {
        setupEnvironment()
        
    }
    
    func setupEnvironment() {
        let currentEnvironment:EnvironmentParameters
#if DEVELOP
        currentEnvironment = DevelopEnvironment()
#elseif STAGING
        currentEnvironment = StagingEnvironment()
#else
        currentEnvironment = ProductionEnvironment()
#endif
        
        Constant.environment = currentEnvironment
        
    }
    
}

