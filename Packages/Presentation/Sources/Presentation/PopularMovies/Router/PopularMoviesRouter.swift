//
//  PopularMoviesRouter.swift
//  
//
//  Created by Hussam Elsadany on 23/01/2023.
//

import SwiftUI
import Domain
import Data
import NetworkProvider

protocol PopularMoviesRouterProtocol {
    func go(to: PopularMoviesRoute)
}

public class PopularMoviesRouter: PopularMoviesRouterProtocol {

    var view: PopularMovieListView?

    public static func assemple() -> PopularMovieListView? {
        let repo = MoviesRepository(clientService: MovieService.getPopular())
        let useCase = PopularMoviesUseCase(repo: repo)
        let viewModel = PopularMovieListViewModel(useCase: useCase)
        let view = PopularMovieListView(viewModel: viewModel)
        let router = PopularMoviesRouter()
        router.view = view
        return  view
    }

    public func go(to: PopularMoviesRoute) {
        //view.push()
    }
}
