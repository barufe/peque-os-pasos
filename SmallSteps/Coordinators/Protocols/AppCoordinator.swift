//
//  AppCoordinator.swift
//  SmallSteps
//
//  Created by T09870 on 25/02/24.
//

import Foundation

public protocol AppCoordinator: ParentCoordinator {
    func presentMessageView(type: MessageViewType)
    func loader(isVisible:Bool)
}


