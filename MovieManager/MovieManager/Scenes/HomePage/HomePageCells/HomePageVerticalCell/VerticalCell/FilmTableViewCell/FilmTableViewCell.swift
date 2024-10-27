//
//  FilmTableViewCell.swift
//  MovieManager
//
//  Created by MacBook on 26.10.24.
//

import UIKit

class FilmTableViewCell: UITableViewCell {
    static let identifier = "TableViewCell"
    
    private lazy var filmImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.widthAnchor.constraint(equalToConstant: 85).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Merriweather-Bold", size: 14)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var rateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Merriweather-Regular", size: 12)
        label.textAlignment = .left
        
        return label
    }()
    
    private lazy var rateStarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Star")
        
        return imageView
    }()
    
    private lazy var categoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(CategoryCollectionCell.self, forCellWithReuseIdentifier: CategoryCollectionCell.identifier)

        return collectionView
    }()
    
    private lazy var filmDuration: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Merriweather-Regular", size: 12)
        label.textAlignment = .left
        
        return label
    }()
    
    private lazy var durationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Duration")
        
        return imageView
    }()
    
    private lazy var detailsWrapper: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var rateAndStarImageStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [rateStarImageView, rateLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 4
        
        return stackView
    }()
    
    private lazy var durationImageViewAndLabelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [durationImageView, filmDuration])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 4
        
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let homePageViewModel = HomePageViewModel()

    private func setup() {
        contentView.addSubview(filmImageView)
        contentView.addSubview(detailsWrapper)
        detailsWrapper.addSubview(nameLabel)
        detailsWrapper.addSubview(rateAndStarImageStackView)
        detailsWrapper.addSubview(categoryCollectionView)
        detailsWrapper.addSubview(durationImageViewAndLabelStackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            filmImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 25),
            filmImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            filmImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            detailsWrapper.leftAnchor.constraint(equalTo: filmImageView.rightAnchor, constant: 20),
            detailsWrapper.topAnchor.constraint(equalTo: contentView.topAnchor),
            detailsWrapper.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            detailsWrapper.rightAnchor.constraint(equalTo: contentView.rightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.leftAnchor.constraint(equalTo: detailsWrapper.leftAnchor),
            nameLabel.topAnchor.constraint(equalTo: detailsWrapper.topAnchor),
            rateAndStarImageStackView.leftAnchor.constraint(equalTo: detailsWrapper.leftAnchor),
            rateAndStarImageStackView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            categoryCollectionView.topAnchor.constraint(equalTo: rateAndStarImageStackView.bottomAnchor, constant: 8),
            categoryCollectionView.leftAnchor.constraint(equalTo: detailsWrapper.leftAnchor),
            categoryCollectionView.rightAnchor.constraint(equalTo: detailsWrapper.rightAnchor),
            durationImageViewAndLabelStackView.leftAnchor.constraint(equalTo: detailsWrapper.leftAnchor),
            durationImageViewAndLabelStackView.topAnchor.constraint(equalTo: categoryCollectionView.bottomAnchor, constant: 8)
        ])
    }
    
    func configure(with film: FilmModel) {
        filmImageView.image = film.image
        nameLabel.text = film.name
        rateLabel.text = "\(film.imdbRating)"
        filmDuration.text = film.length
        
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        categoryCollectionView.reloadData()
    }
}

extension FilmTableViewCell: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homePageViewModel.getPopularMovies().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FilmTableViewCell.identifier, for: indexPath) as? FilmTableViewCell else {
            return UITableViewCell()
        }
        let currentFilm = homePageViewModel.getPopularMovies()[indexPath.row]
        
        cell.configure(with: currentFilm)
        return cell
    }
}

extension FilmTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionCell.identifier, for: indexPath) as! CategoryCollectionCell
        
        let currentFilm = homePageViewModel.getPopularMovies()[indexPath.row]
        
        currentFilm.genre.forEach {
            cell.setCategory(with: $0.description)
        }
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 65, height: 25)
    }
}

