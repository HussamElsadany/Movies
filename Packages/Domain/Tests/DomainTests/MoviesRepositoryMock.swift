//
//  MoviesRepositoryMock.swift
//  
//
//  Created by Hussam Elsadany on 23/01/2023.
//

import Domain

class MoviesRepositoryMock: MoviesRepositoryProtocol {

    let moviesResult: Result<MovieList, Swift.Error>

    init(result: Result<MovieList, Swift.Error>) {
        self.moviesResult = result
    }

    func fetchPopularMovies(page: Int, completion: @escaping (Result<MovieList, Swift.Error>) -> Void) {
        completion(moviesResult)
    }

    func fetchTopRatedMovies(completion: @escaping (Result<MovieList, Error>) -> Void) {
        completion(moviesResult)
    }
}
