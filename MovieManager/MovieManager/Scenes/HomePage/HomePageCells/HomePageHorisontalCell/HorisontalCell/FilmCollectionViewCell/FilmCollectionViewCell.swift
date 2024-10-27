//
//  FilmCollectionViewCell.swift
//  MovieManager
//
//  Created by MacBook on 26.10.24.
//

import UIKit

final class FilmCollectionViewCell: UICollectionViewCell {
    
    private lazy var filmImageContainerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.3
        containerView.layer.shadowOffset = CGSize(width: 0, height: 5)
        containerView.layer.shadowRadius = 10
        
        return containerView
    }()
    
    private lazy var filmImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private lazy var filmNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont(name: "Merriweather-Bold", size: 14)
        label.textColor = UIColor(hexString: "000000")
        label.textAlignment = .left
        
        return label
    }()
    
    private lazy var filmRateImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(systemName: "star.fill")
        imageView.tintColor = UIColor(hexString: "FFC319")
        
        return imageView
    }()
    
    private lazy var filmRateLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "Merriweather-Regular", size: 12)
        label.textColor = UIColor(hexString: "9C9C9C")
        label.textAlignment = .left
        
        return label
    }()
    
    private lazy var rateImageViewAndLabelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [filmRateImageView, filmRateLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 4
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        filmImageContainerView.addSubview(filmImageView)
        contentView.addSubview(filmImageContainerView)
        contentView.addSubview(filmNameLabel)
        contentView.addSubview(rateImageViewAndLabelStackView)
    }
    
    private func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            filmImageContainerView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            filmImageContainerView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            filmImageContainerView.heightAnchor.constraint(equalToConstant: 212),
            filmImageContainerView.widthAnchor.constraint(equalToConstant: 143),
            
            filmImageView.topAnchor.constraint(equalTo: filmImageContainerView.topAnchor),
            filmImageView.leadingAnchor.constraint(equalTo: filmImageContainerView.leadingAnchor),
            filmImageView.trailingAnchor.constraint(equalTo: filmImageContainerView.trailingAnchor),
            filmImageView.bottomAnchor.constraint(equalTo: filmImageContainerView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            filmNameLabel.topAnchor.constraint(equalTo: filmImageContainerView.bottomAnchor, constant: 12),
            filmNameLabel.leadingAnchor.constraint(equalTo: filmImageContainerView.leadingAnchor),
            filmNameLabel.trailingAnchor.constraint(equalTo: filmImageContainerView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            rateImageViewAndLabelStackView.topAnchor.constraint(equalTo: filmNameLabel.bottomAnchor, constant: 8),
            rateImageViewAndLabelStackView.leadingAnchor.constraint(equalTo: filmNameLabel.leadingAnchor),
            rateImageViewAndLabelStackView.trailingAnchor.constraint(equalTo: filmNameLabel.trailingAnchor),
            rateImageViewAndLabelStackView.bottomAnchor.constraint(greaterThanOrEqualTo: contentView.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    public func configureHorisontalCell(film: FilmModel) {
        filmImageView.image = film.image
        filmNameLabel.text = film.name
        filmRateLabel.text = "\(film.imdbRating)"
    }
}
