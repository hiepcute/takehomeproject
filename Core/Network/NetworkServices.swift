//
//  NetworkServices.swift
//  TakeHome
//
//  Created by MACBOOK on 21/12/24.
//

import Foundation

/// Custom errors for the NetworkService.
enum NetworkError: Error {
    /// throw error when get invalid response
    case invalidResponse
    case decodingFailed
    case custom(String)
}

protocol NetworkSession {
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

/// Extension to make URLSession conform to NetworkSession.
extension URLSession: NetworkSession {
    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        return try await self.data(for: request, delegate: nil)
    }
}
class NetworkService {
    private let session: NetworkSession

    /// Initializes the NetworkService with a custom session.
    ///
    /// - Parameter session: An instance conforming to `NetworkSession`.
    init(session: NetworkSession = URLSession.shared) {
        self.session = session
    }

    /// Executes a network request and decodes the response into a specified type.
    ///
    /// - Parameters:
    ///   - url: The URL of the request.
    ///   - method: The HTTP method (GET, POST, etc.). Default is GET.
    ///   - headers: Optional HTTP headers.
    ///   - body: Optional HTTP body.
    ///   - responseType: The type to decode the response into.
    /// - Returns: A decoded object of the specified type.
    /// - Throws: An error if the request fails or decoding fails.
    func fetchData<T: Decodable>(
        from url: URL,
        method: String = "GET",
        headers: [String: String]? = nil,
        body: Data? = nil,
        responseType: T.Type
    ) async throws -> T {
        // Create URLRequest
        var request = URLRequest(url: url)
        request.httpMethod = method
        if let headers = headers {
            for (key, value) in headers {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
        
        request.httpBody = body

        // Perform the network request
        let (data, response) = try await session.data(for: request)

        // Validate the response
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidResponse
        }

        // Decode the data
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            throw NetworkError.decodingFailed
        }
    }
}
