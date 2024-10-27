//
//  FavoritesPageCell.swift
//  MovieManager
//
//  Created by MacBook on 26.10.24.
//

import UIKit

final class FavoritesPageCell: UICollectionViewCell {
    
    static let identifier = "FavoritesPageCell"
    
    private let avatarContainer: UIView = {
        let container = UIView()
        container.layer.shadowColor = UIColor.black.cgColor
        container.layer.shadowOpacity = 0.5
        container.layer.shadowOffset = CGSize(width: 0, height: 5)
        container.layer.shadowRadius = 5.0
        container.layer.cornerRadius = 10
        container.backgroundColor = .clear
        
        return container
    }()
    
    private let avatar: UIImageView = {
        let imageOfFilm = UIImageView()
        imageOfFilm.layer.cornerRadius = 10
        imageOfFilm.layer.masksToBounds = true
        
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
        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatarContainer.translatesAutoresizingMaskIntoConstraints = false
        avatarContainer.addSubview(avatar)
        
        [avatarContainer, nameLabel, ratingDescriptionLabel, favoriteImageStar].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            avatarContainer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            avatarContainer.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            avatarContainer.heightAnchor.constraint(equalToConstant: 200),
            avatarContainer.widthAnchor.constraint(equalToConstant: 150),
            
            avatar.topAnchor.constraint(equalTo: avatarContainer.topAnchor),
            avatar.leadingAnchor.constraint(equalTo: avatarContainer.leadingAnchor),
            avatar.trailingAnchor.constraint(equalTo: avatarContainer.trailingAnchor),
            avatar.bottomAnchor.constraint(equalTo: avatarContainer.bottomAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: avatarContainer.bottomAnchor, constant: 12),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            favoriteImageStar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            favoriteImageStar.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            favoriteImageStar.widthAnchor.constraint(equalToConstant: 20),
            favoriteImageStar.heightAnchor.constraint(equalToConstant: 20),
            
            ratingDescriptionLabel.leadingAnchor.constraint(equalTo: favoriteImageStar.trailingAnchor, constant: 8),
            ratingDescriptionLabel.centerYAnchor.constraint(equalTo: favoriteImageStar.centerYAnchor)
        ])
    }
    
    func configure(with film: FilmModel) {
        avatar.image = film.image
        nameLabel.text = film.name
        ratingDescriptionLabel.text = "\(film.imdbRating)/10 IMDb"
    }
}
