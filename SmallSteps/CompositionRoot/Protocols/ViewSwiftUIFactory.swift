//
//  ViewSwiftUIFactory.swift
//  MBBKLibraryProtocols
//
//  Created by T09870 on 15/02/24.
//

import SwiftUI

public protocol ViewSwiftUIFactory  {
    associatedtype ViewType: View
    associatedtype CoordinatorType
    
    static func createView(coordinator: CoordinatorType) -> ViewType
    static func createHostViewController(coordinator: CoordinatorType) -> GeneralHostingViewcontroller<ViewType>
    static func createPreview() -> ViewType
    static func createPreviewCoordinator() -> CoordinatorType
}
