//
//  RegisterViewModelFactory.swift
//  SmallSteps
//
//  Created by barufe on 3/04/24.
//

import Foundation

struct RegisterViewModelFactory {
    
    static func create(user: UserParameters)-> RegisterViewModel {
        let viewModel = RegisterViewModel(registerUseCase: createUseCase(user: user))
        return viewModel
    }
    
    private static func createUseCase(user: UserParameters) -> RegisterUseCase{
        UsersUseCaseImp(registerRepository: createRepository(user: user))
    }
    private static func createRepository(user: UserParameters) -> RegisterRepository{
        RegisterRepositoryImp(apiDataSource: createApiDataSource(user: user))
    }
    private static func createApiDataSource(user: UserParameters) -> ApiRegisterDataSource{
        ApiRegisterDataSourceImp(networking: NetworkingImp())
    }
}
