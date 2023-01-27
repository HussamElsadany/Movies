//
//  PopularMoviesUseCaseTests.swift
//  
//
//  Created by Hussam Elsadany on 23/01/2023.
//

import XCTest
import Domain

final class PopularMoviesUseCaseTests: XCTestCase {

    func testMovieUseCase_WhenFetchingPopularMovies_Succefully() {
        // Given
        let moveList = MovieList()
        let result: Result<MovieList, Swift.Error>! = .success(moveList)
        let movieRepoMock =  MoviesRepositoryMock(result: result)
        let movieUseCase = PopularMoviesUseCase(repo: movieRepoMock)

        let exp = expectation(description: "Check Fetching Popular Movies is successful")
        var movieResponse: MovieList?

        // When
        movieUseCase.fetchPopularMovies(page: 1) { response in
            movieResponse = response.data
            exp.fulfill()
        }

        // Then
        waitForExpectations(timeout: 0.1)
        XCTAssertEqual(movieResponse, moveList)
    }
}

private extension Result {
    var data: Success? {
        switch self {
        case let .success(data):
            return data
        case .failure:
            return nil
        }
    }
}
