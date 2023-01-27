//
//  MoviesRepository.swift
//  
//
//  Created by Hussam Elsadany on 23/01/2023.
//

import Foundation
import Domain
import NetworkProvider

 public final class MoviesRepository: MoviesRepositoryProtocol {

     // I injected the session to have the ability to test the repos.
     private let session      : SessionProtocol
     private let clientService: NetworkService
     private let client       : NetworkProviderProtocol?

     public init(session: SessionProtocol = Session(), clientService: NetworkService) {
         self.session = session
         self.clientService = clientService
         self.client = MovieServiceClient(session: session, clientService: clientService)
     }

     //TODO: Update the page number to get the next page...
     public func fetchPopularMovies(page: Int, completion: @escaping (Result<MovieList, Swift.Error>) -> Void) {
         client?.request(dataType: MovieList.self, onQueue: .main, completion: { result in
             completion(result)
         })
     }

     public func fetchTopRatedMovies(completion: @escaping (Result<MovieList, Swift.Error>) -> Void) {
         client?.request(dataType: MovieList.self, onQueue: .main, completion: { result in
             completion(result)
         })
     }
 }
