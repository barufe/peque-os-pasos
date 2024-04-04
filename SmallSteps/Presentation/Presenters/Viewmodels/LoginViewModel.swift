//
//  LoginViewModel.swift
//  SmallSteps
//
//  Created by barufe on 1/04/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    private let loginUseCase: LoginUseCase
    init(loginUseCase: LoginUseCase) {
        self.loginUseCase = loginUseCase
    }
    
    func login(user: LoginUserParameters, completion: @escaping (Result<LoginResponseEntity, Error>) -> Void){
        Task {
            do {
                loginUseCase.execute(user: user) {result in
                    switch result {
                    case .success(let response):
                        completion(.success(response))
                    case .failure(let error):
                        completion(.failure(error))
                        print("Error: \(error)")
                    }
                }
            }
        }
    }
    
}
