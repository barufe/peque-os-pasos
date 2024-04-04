//
//  LoginRepositoryImp.swift
//  SmallSteps
//
//  Created by barufe on 4/04/24.
//

import Foundation

class LoginRepositoryImp: LoginRepository {
    private let apiDataSource: ApiLoginDataSource
    let networkManager = NetworkManager.shared
    
    init(apiDataSource: ApiLoginDataSource) {
        self.apiDataSource = apiDataSource
    }
    func login(user: LoginUserParameters, completion: @escaping (Result<LoginResponseEntity, Error>) -> Void) {
        if networkManager.isConnected {
            self.apiDataSource.login(user: user) { result in
                switch result {
                case .success(let responseDto):
                    completion(.success(LoginResponseEntity(message: responseDto.message, status: responseDto.status)))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}
