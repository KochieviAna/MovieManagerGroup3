//
//  FavoritesPageCell.swift
//  MovieManager
//
//  Created by MacBook on 26.10.24.
//

import UIKit

final class FavoritesPageCell: UICollectionViewCell {
    
    static let identifier = "FavoritesPageCell"
    
    private let avatar: UIImageView = {
        let imageOfFilm = UIImageView()
        imageOfFilm.layer.cornerRadius = 10
        imageOfFilm.layer.masksToBounds = true
        imageOfFilm.layer.shadowColor = UIColor.black.cgColor
        imageOfFilm.layer.shadowOpacity = 1.0
        imageOfFilm.layer.shadowOffset = .zero
        imageOfFilm.layer.shadowPath = UIBezierPath(roundedRect: imageOfFilm.bounds, cornerRadius: imageOfFilm.layer.cornerRadius).cgPath
        imageOfFilm.layer.shadowRadius = 15
        
        return imageOfFilm
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    private let ratingDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        label.textColor = .systemGray
        return label
    }()
    
    private let favoriteImageStar: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star.fill")
        imageView.tintColor = .systemYellow
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupCell() {
        [avatar, nameLabel, ratingDescriptionLabel, favoriteImageStar].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
     NSLayoutConstraint.activate([
        avatar.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
        avatar.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        avatar.heightAnchor.constraint(lessThanOrEqualToConstant: 200),
        avatar.widthAnchor.constraint(lessThanOrEqualToConstant: 150),
        
        nameLabel.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: -500),
        nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
        nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 20),
        nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        
        ratingDescriptionLabel.leftAnchor.constraint(equalTo: favoriteImageStar.leftAnchor, constant: 30),
        ratingDescriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: -30),
        
        favoriteImageStar.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
        favoriteImageStar.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: -30)
     ])
    }
    
    func configure(movie: FilmModel) {
        avatar.image = movie.image
        nameLabel.text = movie.name
        ratingDescriptionLabel.text = "\(movie.imdbRating)/10 IMDb"
    }
    
}
