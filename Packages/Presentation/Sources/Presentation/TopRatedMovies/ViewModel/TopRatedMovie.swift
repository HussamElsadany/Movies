//
//  TopRatedMovie.swift
//  Movies
//
//  Created by Hussam Elsadany on 24/01/2023.
//

import ImageCache
import UIKit
import Domain

public class TopRatedMovie: Identifiable, ObservableObject {
    private var image: UIImage

    public let id: Int
    public let title: String
    public let overview: String
    public let posterPath: String
    public let imageSize: String
    public let item: ImageItem

    func fetchImage(_ completion: @escaping (_ image: UIImage) -> Void) {
        ImageCache.public.load(url: item.url as NSURL, item: item) { fetchedItem, image in
            if let img = image {
                self.image = img
                self.item.image = img
                completion(img)
            }
        }
    }

    init(
        id: Int,
        title: String,
        overview: String,
        posterPath: String,
        imageSize: String = MovieImageSize.PosterSize.w154.rawValue
    ) {
        self.id = id
        self.title = title
        self.overview = overview
        self.posterPath = posterPath
        self.imageSize = imageSize
        self.item = ImageItem(
            image: UIImage(systemName: "photo")!,
            url: URL(string: "https://image.tmdb.org/t/p/\(imageSize)\(posterPath)")!
        )

        self.image = UIImage(systemName: "photo")!
    }
}
