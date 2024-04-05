//
//  LoginRepository.swift
//  SmallSteps
//
//  Created by barufe on 4/04/24.
//

import Foundation

protocol LoginRepository {
    func login(user: LoginUserParameters, completion: @escaping (Result<LoginResponseEntity, Error>) -> Void)
}
