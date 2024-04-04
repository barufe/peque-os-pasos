//
//  ProductionEnvironment.swift
//  SmallSteps
//
//  Created by T09870 on 25/02/24.
//
class ProductionEnvironment:EnvironmentParameters {
    
    var baseURL: String
    var baseDomain: String
    
    init() {
        self.baseURL = "https://a313-190-190-235-117.ngrok-free.app/"
        self.baseDomain = "www.SmallSteps.com"
    }
}
