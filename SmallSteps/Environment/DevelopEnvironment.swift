//
//  DevelopEnvironment.swift
//  develop
//
//  Created by T09870 on 25/02/24.
//

class DevelopEnvironment: DevelopParameters {
    
    var baseURL: String
    var baseDomain: String
    var baseMockDomain: String
    
    init() {
        self.baseURL = "http://www.develop.com"
        self.baseDomain = "www.develop.com"
        self.baseMockDomain = "www.develop-mockserver.com"
    }
    
}
