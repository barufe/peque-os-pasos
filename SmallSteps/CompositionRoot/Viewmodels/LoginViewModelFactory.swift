//
//  LoginViewModelFactory.swift
//  SmallSteps
//
//  Created by barufe on 1/04/24.
//

import Foundation

struct LoginViewModelFactory {
    
    static func create()-> LoginViewModel {
        let viewModel = LoginViewModel()
        return viewModel
    }
}
