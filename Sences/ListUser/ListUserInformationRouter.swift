//
//  ListUserInformationRouter.swift
//  TakeHome
//
//  Created MACBOOK on 19/12/24.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

protocol ListUserInformationRoutingLogic: AnyObject {
    func navigationToDetailsViewcontroller()
}

class ListUserInformationRouter {
    weak var viewController: ListUserInformationViewController!
}

extension ListUserInformationRouter: ListUserInformationRoutingLogic {
    func navigationToDetailsViewcontroller() {
        let vc = DetailsUserConfigurator.viewcontroller()
        viewController.navigationController?.pushViewController(vc, animated: false)
    }
    

}
