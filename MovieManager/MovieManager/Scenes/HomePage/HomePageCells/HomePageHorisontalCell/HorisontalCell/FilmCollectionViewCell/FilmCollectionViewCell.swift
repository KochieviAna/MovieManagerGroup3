//
//  FilmCollectionViewCell.swift
//  MovieManager
//
//  Created by MacBook on 26.10.24.
//

import UIKit

final class FilmCollectionViewCell: UICollectionViewCell {
    
    private lazy var filmImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
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
    
    private lazy var rateImageViewAndLabelStckView: UIStackView = {
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
        contentView.addSubview(filmImageView)
        contentView.addSubview(filmNameLabel)
        contentView.addSubview(rateImageViewAndLabelStckView)
    }
    
    private func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            filmImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            filmImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            filmImageView.heightAnchor.constraint(equalToConstant: 212),
            filmImageView.widthAnchor.constraint(equalToConstant: 143)
        ])
        
        NSLayoutConstraint.activate([
            filmNameLabel.topAnchor.constraint(equalTo: filmImageView.bottomAnchor, constant: 12),
            filmNameLabel.leadingAnchor.constraint(equalTo: filmImageView.leadingAnchor),
            filmNameLabel.trailingAnchor.constraint(equalTo: filmImageView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            rateImageViewAndLabelStckView.topAnchor.constraint(equalTo: filmNameLabel.bottomAnchor, constant: 8),
            rateImageViewAndLabelStckView.leadingAnchor.constraint(equalTo: filmNameLabel.leadingAnchor),
            rateImageViewAndLabelStckView.trailingAnchor.constraint(equalTo: filmNameLabel.trailingAnchor),
            rateImageViewAndLabelStckView.bottomAnchor.constraint(greaterThanOrEqualTo: contentView.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    public func configureHorisontalCell() {
        
    }
}
