//
//  ViewControllerUIKitFactory.swift
//  MBBKLibraryProtocols
//
//  Created by T09870 on 15/02/24.
//

import UIKit

public protocol ViewControllerUIKitFactory {
    associatedtype ViewControllerType: UIViewController
    associatedtype CoordinatorType
    
    static func createViewController(coordinator: CoordinatorType) -> ViewControllerType
}
