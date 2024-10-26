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
        label.textColor = UIColor(hex: "#88A4E8")
        label.textAlignment = .center
        label.layer.cornerRadius = 16
        label.layer.masksToBounds = true
        label.backgroundColor = UIColor(hex: "#DBE3FF")
        return label
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(genreLabel)
        
        NSLayoutConstraint.activate([
            genreLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            genreLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
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

// MARK: - UIColor Extension

extension UIColor {
    convenience init?(hex: String) {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }
        var rgb: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgb)
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

