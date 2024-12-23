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
    
    /// Loads user data from local storage (Core Data).
    ///
    /// - Returns: An array of `UserInformationModel`.
    /// - Throws: An error if fetching from Core Data fails.
    func loadUserDataFromLocal() throws -> [UserInformationModel]
    
    ///Saving data to disk 
    func saveUserData(_ users: [UserInformationModel]) throws
    
}

class ListUserInformationWorker: ListUserInformationWorkerLogic {
    private let userRepository: UserRepository
    private let networkService: NetworkService
    
    init(userRepository: UserRepository, networkService: NetworkService = NetworkService()) {
        self.userRepository = userRepository
        self.networkService = networkService
    }
    
    func loadUserDataFromLocal() throws -> [UserInformationModel] {
        let localUsers = try userRepository.fetchUsers()
        return localUsers.map {
            UserInformationModel(login: $0.login ?? "", avatar_url: $0.avatar_url ?? "")
        }
    }
    
    func saveUserData(_ users: [UserInformationModel]) throws {
        try userRepository.saveUsers(users)
    }
    
    func fetchUserInformation(url: String) async throws -> [UserInformationModel] {
        let header = ["Content-Type": "application/json;charset=utf-8"]
        guard let url = URL(string: url) else { throw CommonError.URLinValid }
        let model: [UserInformationModel] = try await networkService.fetchData(from: url, headers: header, responseType: [UserInformationModel].self)
        return model
        
    }
    
}

enum CommonError: Error {
    case URLinValid
}
