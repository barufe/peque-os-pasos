//
//  RegisterRepositoryImp.swift
//  SmallSteps
//
//  Created by barufe on 4/04/24.
//

import Foundation

class RegisterRepositoryImp: RegisterRepository {
        private let apiDataSource: ApiRegisterDataSource
        let networkManager = NetworkManager.shared
        
        init(apiDataSource: ApiRegisterDataSource) {
            self.apiDataSource = apiDataSource
        }
        
        func register(user: RegisterUserParameters, completion: @escaping (Result<RegisterResponseEntity, Error>) -> Void) {
            if networkManager.isConnected {
                self.apiDataSource.register(user: user) { result in
                    switch result {
                    case .success(let responseDto):
                        completion(.success(RegisterResponseEntity(message: responseDto.message, status: responseDto.status)))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            }
        }
    }
