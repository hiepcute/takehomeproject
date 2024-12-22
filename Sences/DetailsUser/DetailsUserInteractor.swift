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
    var userDetailsModel: UserDetailsViewModel { get }
    func getUserFollowingAndFollowerUser()
}

/// DetailsUser Module Interactor
class DetailsUserInteractor {
    weak var presenter: DetailsUserPresentationLogic!
    weak var router: DetailsUserRoutingLogic!
    private var worker: DetailsUserWorkerLogic
    internal var userDetailsModel: UserDetailsViewModel
    
    required init(withWorker worker: DetailsUserWorkerLogic, userDetailsModel: UserDetailsViewModel) {
        self.worker = worker
        self.userDetailsModel = userDetailsModel
    }
}

extension DetailsUserInteractor: DetailsUserInteractorLogic {
    func getUserFollowingAndFollowerUser() {
        presenter.showLoading()
        Task {
            do {
                async let followerModel: [FollowModel] = try worker.fetchFollowUser(url: APIEndPoint.followerUser(username: userDetailsModel.name))
                async let followingModel: [FollowModel] = try worker.fetchFollowUser(url: APIEndPoint.followingUser(username: userDetailsModel.name))
                async let inforUserModel: InformationUserModel = try worker.fetchInformationUser(url: APIEndPoint.userDetails(username: userDetailsModel.name))
                let detailsUserModel: DetailsUserModel = try await DetailsUserModel(numberFollowrer: followerModel.count, numberFollowing: followingModel.count, location: inforUserModel.location ?? "VietNam", blog: inforUserModel.blog ?? "")
                presenter.hideLoading()
                await presenter.fetchDataSuccessFully(model: detailsUserModel)
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

}

