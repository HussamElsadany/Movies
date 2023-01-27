//
//  MovieServiceClient.swift
//  
//
//  Created by Hussam Elsadany on 23/01/2023.
//

import Foundation
import NetworkProvider

public struct MovieServiceClient: NetworkProviderProtocol {
    public let urlSession: SessionProtocol
    public let service: NetworkService

    public init(session: SessionProtocol, clientService: NetworkService) {
        urlSession = session
        service = clientService
    }

    public func request<T>(
        dataType: T.Type,
        onQueue: DispatchQueue = .main,
        completion: @escaping (Result<T, Swift.Error>) -> Void
    ) where T: Decodable {
        let task = urlSession.dataTask(service.urlRequest, dataType: dataType) { result in
            onQueue.async {
                completion(result)
            }
        }
        task.resume()
    }
}
