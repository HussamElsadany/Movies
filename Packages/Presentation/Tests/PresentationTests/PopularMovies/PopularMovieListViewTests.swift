//
//  PopularMovieListViewTests.swift
//  
//
//  Created by Hussam Elsadany on 26/01/2023.
//

import XCTest
import Domain
import Presentation

private enum FetchPopularQueriedUseCase: Error {
    case someError
}

final class PopularMovieListViewTests: XCTestCase {

    func testMovieUseCase_WhenFetchingPopularMovies_Succefully() {
        // Given
        let moveis = MovieList()
        let useCase = PopularMoviesUseCaseMock()
        useCase.expectation = self.expectation(description: "Popular Movies Fetched")
        useCase.movies = moveis
        let viewModel = PopularMovieListViewModel(useCase: useCase)

        // When
        viewModel.loadData()

        // then
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertEqual(viewModel.datasource.count, moveis.results.count)
    }

    func testMovieUseCase_WhenFetchingPopularMovies_Failed() {
        // Given
        let useCase = PopularMoviesUseCaseMock()
        useCase.expectation = self.expectation(description: "Popular Movies Fetched")
        useCase.error = FetchPopularQueriedUseCase.someError
        let viewModel = PopularMovieListViewModel(useCase: useCase)

        // When
        viewModel.loadData()

        // then
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(viewModel.datasource.isEmpty)
    }
}
