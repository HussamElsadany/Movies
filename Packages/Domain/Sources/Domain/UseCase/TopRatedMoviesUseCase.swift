//
//  TopRatedMoviesUseCase.swift
//  
//
//  Created by Hussam Elsadany on 25/01/2023.
//

// MARK: - TopRatedMoviesUseCaseProtocol
public protocol TopRatedMoviesUseCaseProtocol: AnyObject {
    func fetchTopRatedMovies(completion: @escaping (Result<MovieList, Swift.Error>) -> Void)
}

// MARK: - TopRatedMoviesUseCase
public class TopRatedMoviesUseCase {
    private let repo: MoviesRepositoryProtocol

    public init(repo: MoviesRepositoryProtocol) {
        self.repo = repo
    }
}

extension TopRatedMoviesUseCase: TopRatedMoviesUseCaseProtocol {
    public func fetchTopRatedMovies(completion: @escaping (Result<MovieList, Error>) -> Void) {
        repo.fetchTopRatedMovies { result in
            completion(result)
        }
    }
}
