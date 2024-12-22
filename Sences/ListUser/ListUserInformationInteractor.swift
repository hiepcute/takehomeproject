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
    func loadUserData()
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
                let result = try await worker.fetchUserInformation(url:APIEndPoint.userInformation(perPage: 20, since: 100))
                self.updateModel(model: result)
                presenter.hideLoading()
                let userRepository = UserRepository(context: CoreDataManager.shared.context)
                try userRepository.saveUsers(result)
                await presenter.fetchDataSuccessFully()
            } catch let error as NetworkError {
                presenter.hideLoading()
                switch error {
                case .invalidResponse:
                    await presenter.fetchDataError(error: "invalidResponse")
                case .decodingFailed:
                    await presenter.fetchDataError(error: "decodingFailed")
                case .custom(let error):
                    await presenter.fetchDataError(error: error)
                }
                
            }
        }
    }
    
    func updateModel(model: [UserInformationModel]) {
        self.model = model
    }
    
    func loadUserData() {
        presenter.showLoading()
        Task {
            do {
                let localUsers = try worker.loadUserDataFromLocal()
                
                if localUsers.isEmpty {
                    print("Core Data is empty. Fetching from API.")
                    let result = try await worker.fetchUserInformation(url: APIEndPoint.userInformation(perPage: 20, since: 100))
                    try worker.saveUserData(result)
                    self.updateModel(model: result)
                } else {
                    print("Core Data is not empty. using Data from Disk.")
                    self.updateModel(model: localUsers)
                }
                
                presenter.hideLoading()
                await presenter.fetchDataSuccessFully()
            } catch let error as NetworkError {
                presenter.hideLoading()
                switch error {
                case .invalidResponse:
                    await presenter.fetchDataError(error: "Invalid response from server.")
                case .decodingFailed:
                    await presenter.fetchDataError(error: "Failed to decode response.")
                case .custom(let error):
                    await presenter.fetchDataError(error: error)
                }
            } catch {
                presenter.hideLoading()
                await presenter.fetchDataError(error: error.localizedDescription)
            }
        }
    }
}

extension ListUserInformationInteractor: ListUserInformationInteractorLogic {
}

