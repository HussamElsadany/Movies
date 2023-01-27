//
//  TopRatedTableviewCell.swift
//  Movies
//
//  Created by Hussam Elsadany on 24/01/2023.
//

import UIKit

class TopRatedTableviewCell: UITableViewCell {

    static let Identifier = "TopRatedTableviewCell"

    private let movieImageView = UIImageView()
    private let movieTextLabel = UILabel()
    private let movieSubTextLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        movieImageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        movieImageView.layer.cornerRadius = 8
        movieImageView.layer.masksToBounds = true


        movieTextLabel.textAlignment = .left
        movieTextLabel.textColor = .black

        movieSubTextLabel.textAlignment = .left
        movieSubTextLabel.numberOfLines = 3
        movieSubTextLabel.textColor = .gray
        
        //Stack View
        let verticalStackView   = UIStackView()
        verticalStackView.axis  = NSLayoutConstraint.Axis.vertical
        verticalStackView.distribution  = UIStackView.Distribution.equalSpacing
        verticalStackView.alignment = UIStackView.Alignment.leading
        verticalStackView.spacing   = 8

        verticalStackView.addArrangedSubview(movieTextLabel)
        verticalStackView.addArrangedSubview(movieSubTextLabel)
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false

        let horizontalStackView   = UIStackView()
        horizontalStackView.axis  = NSLayoutConstraint.Axis.horizontal
        horizontalStackView.distribution  = UIStackView.Distribution.equalSpacing
        horizontalStackView.alignment = UIStackView.Alignment.center
        horizontalStackView.spacing   = 16.0

        horizontalStackView.addArrangedSubview(movieImageView)
        horizontalStackView.addArrangedSubview(verticalStackView)
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(horizontalStackView)

        //Constraints
        horizontalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        horizontalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        horizontalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        horizontalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TopRatedTableviewCell {
    func configureCell(_ movie: TopRatedMovie) {
        movie.fetchImage { [weak self] image in
            self?.movieImageView.image = image
        }

        movieTextLabel.text = movie.title
        movieSubTextLabel.text = movie.overview
    }
}
