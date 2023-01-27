//
//  MovieList.swift
//  
//
//  Created by Hussam Elsadany on 23/01/2023.
//

public struct MovieList: Decodable, Equatable {
    public let page: Int
    public let results: [Movie]
    public let totalPages: Int
    public let totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }

    public init(page: Int = 1, results: [Movie] = [], totalPages: Int = 1, totalResults: Int = 0) {
        self.page = page
        self.results = results
        self.totalPages = totalPages
        self.totalResults = totalResults
    }
}
