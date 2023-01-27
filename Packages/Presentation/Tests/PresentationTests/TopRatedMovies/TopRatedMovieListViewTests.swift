//
//  TopRatedMovieListViewTests.swift
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

final class TopRatedMovieListViewTests: XCTestCase {

    func testMovieUseCase_WhenFetchingTopRatedMovies_Succefully() {
        // Given
        let moveis = MovieList()
        let useCase = TopRatedMoviesUseCaseMock()
        useCase.expectation = self.expectation(description: "Popular Movies Fetched")
        useCase.movies = moveis
        let viewModel = TopRatedMovieViewModel(useCase: useCase)

        // When
        viewModel.loadData()

        // then
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertEqual(viewModel.datasource.count, moveis.results.count)
    }

    func testMovieUseCase_WhenFetchingTopRatedMovies_Failed() {
        // Given
        let useCase = TopRatedMoviesUseCaseMock()
        useCase.expectation = self.expectation(description: "Popular Movies Fetched")
        useCase.error = FetchPopularQueriedUseCase.someError
        let viewModel = TopRatedMovieViewModel(useCase: useCase)

        // When
        viewModel.loadData()

        // then
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(viewModel.datasource.isEmpty)
    }
}
