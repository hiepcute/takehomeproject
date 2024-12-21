//
//  ListUserInformationWorker.swift
//  TakeHome
//
//  Created MACBOOK on 19/12/24.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import Foundation

protocol ListUserInformationWorkerLogic {
    /// Fetches user information from the provided URL using async/await.
    ///
    /// - Parameter url: The URL of the request as a String.
    /// - Returns: An array of `UserInformationModel`.
    /// - Throws: An error if the request fails or decoding fails.
    func fetchUserInformation(url: String) async throws -> [UserInformationModel]
}

class ListUserInformationWorker: ListUserInformationWorkerLogic {
    func fetchUserInformation(url: String) async throws -> [UserInformationModel] {
        let urlSession = URLSession.shared
        let header = ["Content-Type": "application/json;charset=utf-8"]
        let networkServices = NetworkService(session: urlSession)
       
        guard let url = URL(string: url) else { throw CommonError.URLinValid }
        let model: [UserInformationModel] = try await networkServices.fetchData(from: url, headers: header, responseType: [UserInformationModel].self)
        return model
        
    }

}

enum CommonError: Error {
    case URLinValid
}
