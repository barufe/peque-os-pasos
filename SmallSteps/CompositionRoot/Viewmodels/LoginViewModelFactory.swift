//
//  LoginViewModelFactory.swift
//  SmallSteps
//
//  Created by barufe on 1/04/24.
//

import Foundation

struct LoginViewModelFactory {
    
    static func create()-> LoginViewModel {
        let viewModel = LoginViewModel(loginUseCase: createUseCase())
        return viewModel
    }
    private static func createUseCase() -> LoginUseCase{
        LoginUseCaseImp(loginRepository: createRepository())
    }
    private static func createRepository() -> LoginRepository{
        LoginRepositoryImp(apiDataSource: createApiDataSource())
    }
    private static func createApiDataSource() -> ApiLoginDataSource{
        ApiLoginDataSourceImp(networking: NetworkingImp())
    }
}
