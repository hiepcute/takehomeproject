//
//  ListUserInformationInteractor.swift
//  TakeHome
//
//  Created MACBOOK on 19/12/24.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

/// ListUserInformation Module Interactor Protocol
protocol ListUserInformationInteractorLogic {
    func fetchUser()
}

/// ListUserInformation Module Interactor
class ListUserInformationInteractor {
    weak var presenter: ListUserInformationPresentationLogic!
    weak var router: ListUserInformationRoutingLogic!
    private var worker: ListUserInformationWorkerLogic
    
    required init(withWorker worker: ListUserInformationWorkerLogic) {
        self.worker = worker
    }
    
    func fetchUser() {
        presenter.showLoading()
        Task {
            do {
                
                let result = try await worker.fetchUserInformation(url: Constant.APIEndPoint.userInformationAPI)
                presenter.hideLoading()
                print("========== result === \(result)==============")
                
            } catch {
                
            }
        }
    }
}

extension ListUserInformationInteractor: ListUserInformationInteractorLogic {

}

