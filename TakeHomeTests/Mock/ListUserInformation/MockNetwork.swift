import Foundation
@testable import TakeHome

class MockNetworkService: NetworkService {
    var mockUsers: [UserInformationModel] = []
    var fetchDataError: Error?
    
    override func fetchData<T: Decodable>(
        from url: URL,
        method: String = "GET",
        headers: [String: String]? = nil,
        body: Data? = nil,
        responseType: T.Type
    ) async throws -> T {
        if let error = fetchDataError {
            throw error
        }
        
        guard T.self == [UserInformationModel].self else {
            throw NSError(domain: "MockNetworkService", code: -1, userInfo: [NSLocalizedDescriptionKey: "Unexpected type requested"])
        }
        
        return mockUsers as! T
    }
}
