//
//  File.swift
//  
//
//  Created by Hussam Elsadany on 26/01/2023.
//

import XCTest
import Domain

final class PopularMoviesUseCaseMock: PopularMoviesUseCaseProtocol {

    var expectation: XCTestExpectation?
    var error: Error?
    var movies: MovieList?

    func fetchPopularMovies(page: Int, completion: @escaping (Result<MovieList, Swift.Error>) -> Void) {
        if let error = error {
            completion(.failure(error))
        } else if let movies = movies {
            completion(.success(movies))
        }
        expectation?.fulfill()
    }
}
