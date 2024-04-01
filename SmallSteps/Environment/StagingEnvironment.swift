//
//  StagingEnvironment.swift
//  staging
//
//  Created by T09870 on 25/02/24.
//
class StagingEnvironment:EnvironmentParameters {
    
    var baseURL: String
    var baseDomain: String
    
    init() {
        self.baseURL = "http://www.staging.com"
        self.baseDomain = "www.staging.com"
    }
    
}
