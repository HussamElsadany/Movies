//
//  File.swift
//  
//
//  Created by Hussam Elsadany on 25/01/2023.
//

import Foundation
import NetworkProvider
@testable import Data
@testable import Domain

typealias MovieResult = Result<MovieList, Swift.Error>

// MARK: - ServiceMock
struct MovieServiceMock: NetworkService {

    var baseURL: String { "https:hussam.com" }

    var path: String { "path" }

    var method: HttpMethod { .get }

    var httpBody: Encodable?

    var headers: [String : String]? { ["addtionalHeader": "TESTING_HEADER"] }

    var queryParameters: [URLQueryItem]? { nil }

    var timeout: TimeInterval? { 30 }
}

// MARK: - SessionMock
/// This is not the right solution for mocking the network but I have no time to modify the implementation of  Network.
final class SessionMock: SessionProtocol {

    private let result: MovieResult

    init(result: MovieResult) {
        self.result = result
    }

    func dataTask<T: Decodable>(_ request: URLRequest, dataType: T.Type, completion: @escaping (Result<T, Swift.Error>) -> Void) -> URLSessionDataTask {
        switch result {
        case .success(let data):
            completion(.success(data as! T))
        case .failure(let error):
            completion(.failure(error))
        }
        return URLSession.shared.dataTask(with: request) { data, response, error in }
    }
}
