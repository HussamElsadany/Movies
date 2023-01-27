//
//  TopRatedMoviesRouter.swift
//  Movies
//
//  Created by Hussam Elsadany on 24/01/2023.
//

import Domain
import Data
import NetworkProvider

protocol TopRatedMoviesRouterProtocol {
    func go(to: TopRatedMoviesRoute)
}

public class TopRatedMoviesRouter: TopRatedMoviesRouterProtocol {

    var view: TopRatedListViewController?

    public static func assemple() -> TopRatedListViewController? {
        let repo = MoviesRepository(clientService: MovieService.getTopRated)
        let useCase = TopRatedMoviesUseCase(repo: repo)
        let viewModel = TopRatedMovieViewModel(useCase: useCase)
        let view = TopRatedListViewController(viewModel: viewModel)
        let router = TopRatedMoviesRouter()
        router.view = view
        return  view
    }

    public func go(to: TopRatedMoviesRoute) {
        //view.push()
    }
}
