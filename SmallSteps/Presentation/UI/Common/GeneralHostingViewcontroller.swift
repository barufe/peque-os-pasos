//
//  GeneralHostingViewcontroller.swift
//  SmallSteps
//
//  Created by T09870 on 25/02/24.
//

import SwiftUI

public class GeneralHostingViewcontroller <Content>: UIHostingController<AnyView> where Content : View {

    public init(shouldShowNavigationBar: Bool, rootView: Content, modalPresentationStyle:UIModalPresentationStyle = .overFullScreen) {
      super.init(rootView: AnyView(rootView.navigationBarHidden(!shouldShowNavigationBar)))
      self.modalPresentationStyle = modalPresentationStyle
  }

  @objc required dynamic init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
}
