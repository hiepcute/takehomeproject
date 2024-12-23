//
//  ListUserInformationConfigurator.swift
//  TakeHome
//
//  Created MACBOOK on 19/12/24.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class ListUserInformationConfigurator {
    
    // MARK: Configuration
    class func viewcontroller() -> ListUserInformationViewController {
        
        // MARK: Initialise components.
        let viewController = ListUserInformationViewController(nibName: "ListUserInformationViewController", bundle: nil)
        let userRepository = UserRepository(context: CoreDataManager.shared.context)
        let interactor = ListUserInformationInteractor(withWorker: ListUserInformationWorker(userRepository: userRepository,networkService: NetworkService(session: URLSession.shared)))
        let router = ListUserInformationRouter()
        
        // MARK: link VIP components.
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = viewController
        interactor.router = router
        
        router.viewController = viewController

        return viewController
    }
}
