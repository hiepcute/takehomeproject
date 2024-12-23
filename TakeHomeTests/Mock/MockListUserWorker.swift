import Foundation
@testable import TakeHome

class MockListUserInformationWorker: ListUserInformationWorkerLogic {
    
    var loadUserDataFromLocalResult: Result<[UserInformationModel], Error>?
    var fetchUserInformationResult: Result<[UserInformationModel], NetworkError>?
    var saveUserDataCalled = false
    
    func loadUserDataFromLocal() throws -> [UserInformationModel] {
        if let result = loadUserDataFromLocalResult {
            switch result {
            case .success(let data):
                return data
            case .failure(let error):
                throw error
            }
        }
        return []
    }
    
    func fetchUserInformation(url: String) async throws -> [UserInformationModel] {
        if let result = fetchUserInformationResult {
            switch result {
            case .success(let data):
                return data
            case .failure(let error):
                throw error
            }
        }
        return []
    }
    
    func saveUserData(_ users: [UserInformationModel]) throws {
        saveUserDataCalled = true
    }
}
