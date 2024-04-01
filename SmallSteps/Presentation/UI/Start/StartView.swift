//
//  StartView.swift
//  SmallSteps
//
//  Created by T09870 on 25/02/24.
//

import SwiftUI

struct StartView: View {
    @ObservedObject var viewmodel: StartViewModel
    var coordinator: StartCoordinator
    
    init(viewmodel: StartViewModel, coordinator: StartCoordinator) {
        self.viewmodel = viewmodel
        self.coordinator = coordinator
    }
    
    var body: some View {
        Text(Constant.environment.baseURL)
        Text(Constant.environment.baseDomain)
    }
}

#Preview {
    StartViewFactory.createPreview()
}
