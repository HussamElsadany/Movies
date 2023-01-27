//
//  PopularMoviesUseCase.swift
//  
//
//  Created by Hussam Elsadany on 23/01/2023.
//

// MARK: - PopularMoviesUseCaseProtocol
public protocol PopularMoviesUseCaseProtocol: AnyObject {
    func fetchPopularMovies(page: Int, completion: @escaping (Result<MovieList, Swift.Error>) -> Void)
}

// MARK: - PopularMoviesUseCase
public class PopularMoviesUseCase {
    private let repo: MoviesRepositoryProtocol

    public init(repo: MoviesRepositoryProtocol) {
        self.repo = repo
    }
}

extension PopularMoviesUseCase: PopularMoviesUseCaseProtocol {
    public func fetchPopularMovies(page: Int, completion: @escaping (Result<MovieList, Swift.Error>) -> Void) {
        repo.fetchPopularMovies(page: page) { result in
            completion(result)
        }
    }
}
