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
    func navigationToDetailsViewcontroller(userDetailModel: UserDetailsViewModel)
}

class ListUserInformationRouter {
    weak var viewController: ListUserInformationViewController!
}

extension ListUserInformationRouter: ListUserInformationRoutingLogic {
    func navigationToDetailsViewcontroller(userDetailModel: UserDetailsViewModel) {
        let vc = DetailsUserConfigurator.viewcontroller(userDetailsModel: userDetailModel)
        viewController.navigationController?.pushViewController(vc, animated: false)
    }
    

}
