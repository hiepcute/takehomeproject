//
//  DetailsUserWorker.swift
//  TakeHome
//
//  Created MACBOOK on 21/12/24.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import Foundation

protocol DetailsUserWorkerLogic {
    func fetchFollowUser(url: String) async throws -> [FollowModel]
    func fetchInformationUser(url: String) async throws -> InformationUserModel
    
}

class DetailsUserWorker: DetailsUserWorkerLogic {
    func fetchFollowUser(url: String) async throws -> [FollowModel] {
        let urlSession = URLSession.shared
        let header = ["Content-Type": "application/json;charset=utf-8"]
        let networkServices = NetworkService(session: urlSession)
        guard let url = URL(string: url) else { throw CommonError.URLinValid }
        let model: [FollowModel] = try await networkServices.fetchData(from: url, headers: header, responseType: [FollowModel].self)
        return model
    }
    
    func fetchInformationUser(url: String) async throws -> InformationUserModel {
        let urlSession = URLSession.shared
        let header = ["Content-Type": "application/json;charset=utf-8"]
        let networkServices = NetworkService(session: urlSession)
        guard let url = URL(string: url) else { throw CommonError.URLinValid }
        let model: InformationUserModel = try await networkServices.fetchData(from: url, headers: header, responseType: InformationUserModel.self)
        return model
    }
}
