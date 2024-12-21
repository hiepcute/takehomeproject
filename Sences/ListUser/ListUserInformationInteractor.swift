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
    var model: [UserInformationModel] { get }
}

/// ListUserInformation Module Interactor
class ListUserInformationInteractor {
    weak var presenter: ListUserInformationPresentationLogic!
    weak var router: ListUserInformationRoutingLogic!
    
    private var worker: ListUserInformationWorkerLogic
    internal var model: [UserInformationModel] = []
    
    required init(withWorker worker: ListUserInformationWorkerLogic) {
        self.worker = worker
    }
    
    func fetchUser() {
        presenter.showLoading()
        Task {
            do {
                
                let result = try await worker.fetchUserInformation(url: Constant.APIEndPoint.userInformationAPI)
                self.updateModel(model: result)
                presenter.hideLoading()
                await presenter.fetchDataSuccessFully()
                
            } catch {
                
            }
        }
    }
    
    func updateModel(model: [UserInformationModel]) {
        self.model = model
    }
}

extension ListUserInformationInteractor: ListUserInformationInteractorLogic {

}

