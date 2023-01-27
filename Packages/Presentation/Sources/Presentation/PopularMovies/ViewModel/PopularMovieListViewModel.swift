//
//  PopularMovieListViewModel.swift
//  
//
//  Created by Hussam Elsadany on 23/01/2023.
//

import Combine
import Domain

public class PopularMovieListViewModel:  ListViewModelProtocol {
    @Published private(set) var title = "movies_navbar_title".localized
    @Published public private(set) var datasource: [PopularMovie] = []
    @Published var showError = false
    var errorMessage: String?

    private(set) var canFetchingMore =  false
    private(set) var isFetching =  false
    private(set) var page: Int = 1

    private var useCase: PopularMoviesUseCaseProtocol

    public init(useCase: PopularMoviesUseCaseProtocol) {
        self.useCase = useCase
    }

    public func loadData() {
        guard !isFetching else { return }
        isFetching = true
        useCase.fetchPopularMovies(page: page) { result in
            switch result {
            case let .success(movieList):
                self.didLoadPopularMovies(movieList)
            case let .failure(error):
                self.didFailToLoadPopularMovies(error)
            }
        }
    }
}

extension PopularMovieListViewModel {
    func didLoadPopularMovies(_ movies: MovieList) {
        page = movies.page
        canFetchingMore = page < movies.totalPages
        datasource.append(contentsOf: popular(movies.results))
        title = "\("movie_popular_title".localized) (\(datasource.count))"
        isFetching = false
    }

    func didFailToLoadPopularMovies(_ error: Error) {
        errorMessage = "\(error)"
        showError = true
        isFetching = false
    }
}

extension PopularMovieListViewModel {
    func popular(_ movies: [Movie]) -> [PopularMovie] {
        return movies.map {
            return PopularMovie(
                id: $0.id,
                title: $0.title,
                overview: $0.overview,
                posterPath: $0.posterPath
            )
        }
    }
}
