//
//  MessaViewType.swift
//  SmallSteps
//
//  Created by T09870 on 25/02/24.
//

import UIKit

public enum MessageViewType {
    case short(param: MessageViewParameter)
    case large(param: MessageViewParameter)
    case nativeAlert(param: NativeMessageParameter)
}

public struct NativeMessageParameter {
    public let title:String
    public let detail:String
    public let style: UIAlertController.Style
    public let primaryButton:UIAlertAction
    public var secundaryButton:UIAlertAction?
    
    public init(title: String,
                detail: String,
                style: UIAlertController.Style,
                primaryButton: UIAlertAction,
                secundaryButton: UIAlertAction? = nil) {
        
        self.title = title
        self.detail = detail
        self.style = style
        self.primaryButton = primaryButton
        self.secundaryButton = secundaryButton
    }
}

public struct MessageViewParameter {
    public let title: String
    public let detail: String
    public let style: MessageStyle
    public let buttons: MessageAction
    
    public init(title: String, detail: String, style: MessageStyle, buttons: MessageAction) {
        self.title = title
        self.detail = detail
        self.style = style
        self.buttons = buttons
    }
}

public enum MessageStyle {
    case info
    case warning
}

public enum MessageAction {
    case singleButton(button:AlertButton)
    case twoButtons(primaryButton:AlertButton, secondaryButton:AlertButton)
    case witoutButtons
}

public struct AlertButton {
    public var title: String?
    public var image: UIImage?
    public let action: () -> Void
    
    public init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    public init(image: UIImage, action: @escaping () -> Void) {
        self.image = image
        self.action = action
    }
}

