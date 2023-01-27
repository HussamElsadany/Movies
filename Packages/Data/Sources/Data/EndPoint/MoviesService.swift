//
//  PopularMoviesService.swift
//  
//
//  Created by Hussam Elsadany on 23/01/2023.
//

import Foundation
import NetworkProvider

public enum MovieService {
    case getPopular(page: Int = 1)
    case getTopRated
}

extension MovieService: NetworkService {

    public var baseURL: String {
        return CommonMovieService.baseURL
    }

    public var path: String {
        switch self {
        case .getPopular:
            return "/movie/popular"
        case .getTopRated:
            return "/movie/top_rated"
        }
    }

    public var method: HttpMethod {
        return .get
    }

    public var httpBody: Encodable? {
        return nil
    }

    public var headers: [String : String]? {
        return [HttpHeaderKey.accept: MimeType.json.rawValue]
    }

    public var queryParameters: [URLQueryItem]? {
        switch self {
        case .getPopular(let page):
            let pageKeyItem = URLQueryItem(name: "page", value: "\(page)")
            var queryParameters = CommonMovieService.queryItems
            queryParameters.append(pageKeyItem)
            return queryParameters
        case .getTopRated:
            return CommonMovieService.queryItems
        }
    }

    public var timeout: TimeInterval? {
        return 30
    }
}
