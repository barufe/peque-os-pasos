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
        self.baseURL = "https://508b-190-190-235-117.ngrok-free.app/"
        self.baseDomain = "www.develop.com"
        self.baseMockDomain = "www.develop-mockserver.com"
    }
    
}
