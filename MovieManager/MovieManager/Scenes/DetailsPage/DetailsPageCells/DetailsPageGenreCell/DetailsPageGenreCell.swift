//
//  DetailsPageGenreCell.swift
//  MovieManager
//
//  Created by MacBook on 25.10.24.
//

import UIKit

class DetailsPageGenreCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let reuseIdentifier = "GenreCell"
    
    private let genreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = UIColor(hexString: "88A4E8")
        label.textAlignment = .center
        label.layer.cornerRadius = 16
        label.layer.masksToBounds = true
        label.backgroundColor = UIColor(hexString: "DBE3FF")
        return label
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(genreLabel)
        
        NSLayoutConstraint.activate([
            genreLabel.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            genreLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            genreLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            genreLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration
    
    func configure(with genre: String) {
        genreLabel.text = genre
    }
}


