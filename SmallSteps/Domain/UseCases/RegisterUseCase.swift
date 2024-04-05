//
//  RegisterUseCase.swift
//  SmallSteps
//
//  Created by barufe on 4/04/24.
//

import Foundation

protocol RegisterUseCase{
    func execute(user: RegisterUserParameters, completion: @escaping (Result<RegisterResponseEntity, Error>) -> Void)
}

final class UsersUseCaseImp: RegisterUseCase {
    private let registerRepository: RegisterRepository
    private var response: RegisterResponseEntity?
    
    init(registerRepository: RegisterRepository) {
        self.registerRepository = registerRepository
    }
    
    func execute(user: RegisterUserParameters, completion: @escaping (Result<RegisterResponseEntity, Error>) -> Void){
        registerRepository.register(user: user) {result in
            completion(result)
        }
    }
}
