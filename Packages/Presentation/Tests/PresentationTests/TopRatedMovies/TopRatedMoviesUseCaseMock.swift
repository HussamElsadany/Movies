//
//  File.swift
//  
//
//  Created by Hussam Elsadany on 26/01/2023.
//

import XCTest
import Domain

final class TopRatedMoviesUseCaseMock: TopRatedMoviesUseCaseProtocol {

    var expectation: XCTestExpectation?
    var error: Error?
    var movies: MovieList?

    func fetchTopRatedMovies(completion: @escaping (Result<MovieList, Error>) -> Void) {
        if let error = error {
            completion(.failure(error))
        } else if let movies = movies {
            completion(.success(movies))
        }
        expectation?.fulfill()
    }
}
