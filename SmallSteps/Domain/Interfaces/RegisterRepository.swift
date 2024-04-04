//
//  RegisterRepository.swift
//  SmallSteps
//
//  Created by barufe on 4/04/24.
//

import Foundation

protocol RegisterRepository {
    func register(user: RegisterUserParameters, completion: @escaping (Result<RegisterResponseEntity, Error>) -> Void)
}
