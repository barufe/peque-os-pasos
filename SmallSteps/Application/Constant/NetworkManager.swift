//
//  NetworkManager.swift
//  SmallSteps
//
//  Created by barufe on 4/04/24.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    var isConnected: Bool = true
    private init() { }
}
