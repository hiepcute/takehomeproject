//
//  ListUserInformationViewControllerSpy.swift
//  TakeHomeTests
//
//  Created by MACBOOK on 23/12/24.
//

import Foundation
@testable import TakeHome

class MockAlert: AlertPresenting {
    var alertTitle: String?
    var alertMessage: String?
    var alertButtonTitle: String?
    
    func showAlert(title: String, message: String, buttonTitle: String) {
        alertTitle = title
        alertMessage = message
        alertButtonTitle = buttonTitle
    }
}
