//
//  File.swift
//  
//
//  Created by Hussam Elsadany on 25/01/2023.
//

import XCTest
import Domain

final class TopRatedMoviesUseCaseTests: XCTestCase {

    func testMovieUseCase_WhenFetchingTopMovies_Succefully() {
        // Given
        let moveList = MovieList()
        let result: Result<MovieList, Swift.Error>! = .success(moveList)
        let movieRepoMock =  MoviesRepositoryMock(result: result)
        let movieUseCase = TopRatedMoviesUseCase(repo: movieRepoMock)

        let exp = expectation(description: "Check Fetching Top Rated Movies is successful")
        var movieResponse: MovieList?
        
        // When
        movieUseCase.fetchTopRatedMovies { response in
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
