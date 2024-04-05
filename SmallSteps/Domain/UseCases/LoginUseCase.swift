//
//  LoginUseCase.swift
//  SmallSteps
//
//  Created by barufe on 4/04/24.
//

import Foundation

protocol LoginUseCase {
    func execute(user: LoginUserParameters, completion: @escaping (Result<LoginResponseEntity, Error>) -> Void)
}

final class LoginUseCaseImp: LoginUseCase {
    private let loginRepository: LoginRepository
    private var response: LoginResponseEntity?
    
    init(loginRepository: LoginRepository) {
        self.loginRepository = loginRepository
    }
    
    func execute(user: LoginUserParameters, completion: @escaping (Result<LoginResponseEntity, Error>) -> Void){
        loginRepository.login(user: user) {result in
            completion(result)
        }
    }
}
