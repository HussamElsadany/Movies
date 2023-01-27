//
//  TopRatedMovieViewModel.swift
//  Movies
//
//  Created by xdmgzdev on 16/04/2021.
//

import Foundation
import Combine
import Domain

public class TopRatedMovieViewModel: ListViewModelProtocol {

    @Published private(set) var title = "movies_navbar_title".localized
    @Published public private(set) var datasource: [TopRatedMovie] = []
    @Published var showError = false
    var errorMessage: String?

    private var useCase: TopRatedMoviesUseCaseProtocol

    public init(useCase: TopRatedMoviesUseCaseProtocol) {
        self.useCase = useCase
    }

    public func loadData() {
        useCase.fetchTopRatedMovies { result in
            switch result {
            case let .success(movieList):
                self.didLoadTopRatedMovies(movieList)
            case let .failure(error):
                self.didFailToLoadTopRatedMovies(error)
            }
        }
    }
}

extension TopRatedMovieViewModel {
    func didLoadTopRatedMovies(_ movies: MovieList) {
        datasource = topRated(movies.results)
        title = "\("movie_toprated_title".localized) (\(datasource.count))"
    }

    func didFailToLoadTopRatedMovies(_ error: Error) {
        errorMessage = "\(error)"
        showError = true
    }
}

extension TopRatedMovieViewModel {
    func topRated(_ movies: [Movie]) -> [TopRatedMovie] {
        return movies.map {
            return TopRatedMovie(
                id: $0.id,
                title: $0.title,
                overview: $0.overview,
                posterPath: $0.posterPath
            )
        }
    }
}
