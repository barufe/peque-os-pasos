//
//  RegisterViewModelFactory.swift
//  SmallSteps
//
//  Created by barufe on 3/04/24.
//

import Foundation

struct RegisterViewModelFactory {
    
    static func create()-> RegisterViewModel {
        let viewModel = RegisterViewModel(registerUseCase: createUseCase())
        return viewModel
    }
    
    private static func createUseCase() -> RegisterUseCase{
        UsersUseCaseImp(registerRepository: createRepository())
    }
    private static func createRepository() -> RegisterRepository{
        RegisterRepositoryImp(apiDataSource: createApiDataSource())
    }
    private static func createApiDataSource() -> ApiRegisterDataSource{
        ApiRegisterDataSourceImp(networking: NetworkingImp())
    }
}
