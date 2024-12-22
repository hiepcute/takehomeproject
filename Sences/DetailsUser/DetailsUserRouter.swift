//
//  DetailsUserRouter.swift
//  TakeHome
//
//  Created MACBOOK on 21/12/24.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

protocol DetailsUserRoutingLogic: AnyObject {
    func popViewController()
}

class DetailsUserRouter {
    weak var viewController: DetailsUserViewController!
}

extension DetailsUserRouter: DetailsUserRoutingLogic {
    func popViewController() {
        viewController.navigationController?.popViewController(animated: false)
    }
}
