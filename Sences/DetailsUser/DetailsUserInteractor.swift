//
//  DetailsUserInteractor.swift
//  TakeHome
//
//  Created MACBOOK on 21/12/24.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

/// DetailsUser Module Interactor Protocol
protocol DetailsUserInteractorLogic {
    
}

/// DetailsUser Module Interactor
class DetailsUserInteractor {
    weak var presenter: DetailsUserPresentationLogic!
    weak var router: DetailsUserRoutingLogic!
    private var worker: DetailsUserWorkerLogic
    
    required init(withWorker worker: DetailsUserWorkerLogic) {
        self.worker = worker
    }
}

extension DetailsUserInteractor: DetailsUserInteractorLogic {

}

