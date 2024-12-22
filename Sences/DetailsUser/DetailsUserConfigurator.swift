//
//  DetailsUserConfigurator.swift
//  TakeHome
//
//  Created MACBOOK on 21/12/24.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class DetailsUserConfigurator {
    
    // MARK: Configuration
    class func viewcontroller(userDetailsModel: UserDetailsViewModel) -> DetailsUserViewController {
        
        // MARK: Initialise components.
        let viewController = DetailsUserViewController(nibName: "DetailsUserViewController", bundle: nil)
        let interactor = DetailsUserInteractor(withWorker: DetailsUserWorker(), userDetailsModel: userDetailsModel)
        let router = DetailsUserRouter()
        
        // MARK: link VIP components.
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = viewController
        interactor.router = router
        
        router.viewController = viewController

        return viewController
    }
}
