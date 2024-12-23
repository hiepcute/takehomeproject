//
//  MockNetwork.swift
//  TakeHomeTests
//
//  Created by MACBOOK on 23/12/24.
//

import Foundation
@testable import TakeHome

class MockNetworkService: NetworkService {
    var fetchDataResult: Any?
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
        
        guard let result = fetchDataResult as? T else {
            fatalError("MockNetworkService did not return the expected type")
        }
        return result
    }
}
