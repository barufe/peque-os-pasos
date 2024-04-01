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
        self.baseURL = "http://www.SmallSteps.com"
        self.baseDomain = "www.SmallSteps.com"
    }
}
