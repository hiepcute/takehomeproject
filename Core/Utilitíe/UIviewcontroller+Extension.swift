//
//  UIviewcontroller+Extension.swift
//  TakeHome
//
//  Created by MACBOOK on 21/12/24.
//

import Foundation
import UIKit

extension UIViewController {
    /// Displays an alert with a title, message, and a single close button.
    /// - Parameters:
    ///   - title: The title of the alert.
    ///   - message: The detailed message of the alert.
    ///   - buttonTitle: The title of the close button (default: "Close").
    func showAlert(title: String, message: String, buttonTitle: String = "Close") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // Create the close button
        let closeAction = UIAlertAction(title: buttonTitle, style: .cancel, handler: nil)
        
        // Add the close button to the alert
        alertController.addAction(closeAction)
        
        // Present the alert
        self.present(alertController, animated: true, completion: nil)
    }
}
