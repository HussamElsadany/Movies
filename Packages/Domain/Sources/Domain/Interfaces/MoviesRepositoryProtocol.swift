//
//  PopularMoviesRepositoryProtocol.swift.swift
//  
//
//  Created by Hussam Elsadany on 25/01/2023.
//

public protocol MoviesRepositoryProtocol {
    func fetchPopularMovies(page: Int, completion: @escaping (Result<MovieList, Swift.Error>) -> Void)
    func fetchTopRatedMovies(completion: @escaping (Result<MovieList, Swift.Error>) -> Void)
}
