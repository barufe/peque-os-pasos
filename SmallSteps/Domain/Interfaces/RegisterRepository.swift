//
//  RegisterRepository.swift
//  SmallSteps
//
//  Created by barufe on 4/04/24.
//

import Foundation

protocol RegisterRepository {
    func register(user: UserParameters, completion: @escaping (Result<ResponseEntity, Error>) -> Void)
}
