//
//  DetailsPageActorCell.swift
//  MovieManager
//
//  Created by MacBook on 25.10.24.
//

import UIKit
final class ActorCell: UICollectionViewCell {
    static let reuseIdentifier = "ActorCell"

    private let actorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        
        return imageView
    }()
    
    private let actorNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 0
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(actorImageView)
        contentView.addSubview(actorNameLabel)
        
        NSLayoutConstraint.activate([
            actorImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            actorImageView.widthAnchor.constraint(equalToConstant: 60),
            actorImageView.heightAnchor.constraint(equalToConstant: 60),
            actorImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            actorNameLabel.topAnchor.constraint(equalTo: actorImageView.bottomAnchor, constant: 4),
            actorNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            actorNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with actor: ActorModel) {
        actorNameLabel.text = actor.name
        actorImageView.image = actor.image
    }
}

