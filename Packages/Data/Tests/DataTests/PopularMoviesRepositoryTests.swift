//
//  PopularMoviesRepositoryTests.swift
//  
//
//  Created by Hussam Elsadany on 23/01/2023.
//

import XCTest
import Domain
@testable import Data
import NetworkProvider



final class PopularMoviesRepositoryTests: XCTestCase {

    func testMovieUseCase_WhenFetchingPopularMovies_Succefully() {
        // Given
        let moveList = MovieList()
        let result: Result<MovieList, Swift.Error>! = .success(moveList)
        let serviceMock = MovieServiceMock()
        let sessionMock = SessionMock(result: result)
        let sut = MoviesRepository(session: sessionMock, clientService: serviceMock)
        let exp = expectation(description: "Check Fetching Popular Movies is successful")
        var movieResponse: MovieList?

        // When
        sut.fetchPopularMovies(page: 1) { result in
            movieResponse = result.data
            exp.fulfill()
        }

        // Then
        waitForExpectations(timeout: 0.1)
        XCTAssertEqual(movieResponse, moveList)
    }

    func testMovieUseCase_WhenFetchingTopRatedMovies_Succefully() {
        // Given
        let moveList = MovieList()
        let result: Result<MovieList, Swift.Error>! = .success(moveList)
        let serviceMock = MovieServiceMock()
        let sessionMock = SessionMock(result: result)
        let sut = MoviesRepository(session: sessionMock, clientService: serviceMock)
        let exp = expectation(description: "Check Fetching Top Rated Movies is successful")
        var movieResponse: MovieList?

        // When
        sut.fetchTopRatedMovies { result in
            movieResponse = result.data
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
