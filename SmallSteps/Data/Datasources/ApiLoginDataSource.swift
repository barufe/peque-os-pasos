//
//  ApiLoginDataSource.swift
//  SmallSteps
//
//  Created by barufe on 4/04/24.
//

import Foundation
import Alamofire

protocol ApiLoginDataSource {
    func login(user: LoginUserParameters, completion: @escaping (Result<LoginResponseDto, Error>) -> Void)
}

class ApiLoginDataSourceImp: ApiLoginDataSource {
    var networking: Networking
    private let path : String = "api/v1/auth/sign-up"
    
    init(networking: Networking) {
        self.networking = networking
    }
    
    func login(user: LoginUserParameters, completion: @escaping (Result<LoginResponseDto, Error>) -> Void) {
        
        let parameters: [String: String] = [
            "email": user.email,
            "password": user.password,
        ]
        print(parameters)
        print("\(ProductionEnvironment().baseURL + path)")
        
        networking.request(urlBase: "\(ProductionEnvironment().baseURL + path)", method: .post, parameter: parameters, encoding: URLEncoding.default) { result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let responseDto = try decoder.decode(LoginResponseDto.self, from: data)
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




