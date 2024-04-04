//
//  RegisterViewModel.swift
//  SmallSteps
//
//  Created by barufe on 3/04/24.
//

import Foundation

class RegisterViewModel: ObservableObject{
    private let registerUseCase: RegisterUseCase
    init(registerUseCase: RegisterUseCase) {
        self.registerUseCase = registerUseCase
    }
    
    func registerUser(user: RegisterUserParameters, completion: @escaping (Result<RegisterResponseEntity, Error>) -> Void){
        Task {
            do {
                registerUseCase.execute(user: user) {result in
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
