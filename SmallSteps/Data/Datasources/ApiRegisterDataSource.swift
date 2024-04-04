//
//  ApiRegisterDataSource.swift
//  SmallSteps
//
//  Created by barufe on 3/04/24.
//

import Foundation

import Alamofire

protocol ApiRegisterDataSource{
    func register(user: UserParameters, completion: @escaping (Result<ResponseDto, Error>) -> Void)
}


class ApiRegisterDataSourceImp: ApiRegisterDataSource {
    var networking: Networking
    private let path : String = "api/v1/auth/sign-up"
    
    init(networking: Networking) {
        self.networking = networking
    }
    
    func register(user: UserParameters, completion: @escaping (Result<ResponseDto, Error>) -> Void) {
        
        let parameters: [String: Any] = [
            "email": user.email,
            "password": user.password,
            "username": user.username
        ]
        print(parameters)
        
        networking.request(urlBase: "\(ProductionEnvironment().baseURL)", method: .post, parameter: parameters, encoding: URLEncoding.default) { result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let responseDto = try decoder.decode(ResponseDto.self, from: data)
                    completion(.success(responseDto))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    
    

    
}



