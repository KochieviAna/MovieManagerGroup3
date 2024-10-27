//
//  DetailsPageVC.swift
//  MovieManager
//
//  Created by Nkhorbaladze on 25.10.24.
//

import UIKit

final class DetailsPageVC: UIViewController {
    
    // MARK: - Properties
    
    private lazy var backButton = UIButton()
    private lazy var configuration = UIImage.SymbolConfiguration(pointSize: 28)
    private lazy var isBookmarked = false
    
    let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .orange
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        label.textColor = UIColor(hexString: "000000")
        label.textAlignment = .left
        return label
    }()
    
    private let bookmarkButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let imdbLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let genres = ["Action", "Drama", "Comedy", "Horror", "Sci-Fi", "Romance"]
    
    private let genresCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 8
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private let lengthTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor(hexString: "9C9C9C")
        label.text = "Length"
        label.textAlignment = .left
        return label
    }()
    
    private let languageTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .lightGray
        label.text = "Language"
        label.textAlignment = .left
        return label
    }()
    
    private let ratingTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .lightGray
        label.text = "Rating"
        label.textAlignment = .left
        return label
    }()
    
    private let lengthValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private let languageValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private let ratingValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    //description
    private let descriptionTitle: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        label.backgroundColor = .purple
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    
    //ჩამატება ლეთების
    private let actorsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 8
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    // ეს მაგალითები
    private let actors = [("Tom Holland", "actorImage1"), ("Zendaya", "actorImage2"), ("Benedict Cumberbatch", "actorImage3"), ("Tom Holland", "actorImage1"), ("Tom Holland", "actorImage1")]
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        setupBackButton()
        setupMovieImageView()
        setupRoundedView()
        setupTitleLabel()
        setupSmallButton()
        setupIMDbLabel()
        setupGenresCollectionView()
        setupParameters()
        setupDescription()
        setupActorsCollectionView()
    }
    
    // MARK: - Setup Methods
    
    private func setupBackButton() {
        backButton.setImage(UIImage(systemName: "arrow.backward", withConfiguration: configuration), for: .normal)
        backButton.tintColor = .white
        backButton.addAction(UIAction(handler: { [weak self] action in self?.backFunc()}), for: .touchUpInside)
        let backBarButtonItem = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = backBarButtonItem
    }
    
    private func backFunc() {
        navigationController?.popViewController(animated: true)
    }
    
    private func setupMovieImageView() {
        view.addSubview(movieImageView)
        
        NSLayoutConstraint.activate([
            movieImageView.heightAnchor.constraint(equalToConstant: 300),
            movieImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            movieImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            movieImageView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
    }
    
    private func setupRoundedView() {
        view.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: -60),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupTitleLabel() {
        containerView.addSubview(titleLabel)
        
        titleLabel.text = "Spiderman: No Way Home"
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            titleLabel.widthAnchor.constraint(equalToConstant: 240),
            titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 50)
        ])
    }
    
    private func setupSmallButton() {
        containerView.addSubview(bookmarkButton)
        
        bookmarkButton.setImage(UIImage(systemName: "bookmark", withConfiguration: configuration), for: .normal)
        bookmarkButton.tintColor = .black
        
        bookmarkButton.addAction(UIAction(handler: { [weak self] action in self?.toggleBookmark()}), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            bookmarkButton.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 4),
            bookmarkButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            bookmarkButton.widthAnchor.constraint(equalToConstant: 24),
            bookmarkButton.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    private func toggleBookmark() {
        isBookmarked.toggle()
        
        if isBookmarked {
            bookmarkButton.setImage(UIImage(systemName: "bookmark.fill", withConfiguration: configuration), for: .normal)
        } else {
            bookmarkButton.setImage(UIImage(systemName: "bookmark", withConfiguration: configuration), for: .normal)
        }
    }
    
    private func setupIMDbLabel() {
        containerView.addSubview(imdbLabel)
        
        let starImage = UIImage(systemName: "star.fill")
        let attachment = NSTextAttachment(image: starImage!.withRenderingMode(.alwaysOriginal))
        let attachmentString = NSAttributedString(attachment: attachment)
        
        let ratingText = " 9.1/10 IMDb"
        let ratingAttributedString = NSAttributedString(string: ratingText, attributes: [
            .font: UIFont.systemFont(ofSize: 15),
            .foregroundColor: UIColor.gray
        ])
        
        let combinedAttributedString = NSMutableAttributedString()
        combinedAttributedString.append(attachmentString)
        combinedAttributedString.append(ratingAttributedString)
        
        imdbLabel.attributedText = combinedAttributedString
        
        NSLayoutConstraint.activate([
            imdbLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            imdbLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            imdbLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func setupGenresCollectionView() {
        containerView.addSubview(genresCollectionView)
        
        genresCollectionView.register(DetailsPageGenreCell.self, forCellWithReuseIdentifier: DetailsPageGenreCell.reuseIdentifier)
        
        genresCollectionView.dataSource = self
        genresCollectionView.delegate = self
        
        NSLayoutConstraint.activate([
            genresCollectionView.topAnchor.constraint(equalTo: imdbLabel.bottomAnchor, constant: 16),
            genresCollectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            genresCollectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            genresCollectionView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setupParameters() {
        let parametersStackView = UIStackView()
        parametersStackView.translatesAutoresizingMaskIntoConstraints = false
        parametersStackView.axis = .vertical
        parametersStackView.spacing = 4
        
        let titlesStackView = UIStackView()
        titlesStackView.translatesAutoresizingMaskIntoConstraints = false
        titlesStackView.axis = .horizontal
        titlesStackView.spacing = 32
        titlesStackView.alignment = .top
        
        let valuesStackView = UIStackView()
        valuesStackView.translatesAutoresizingMaskIntoConstraints = false
        valuesStackView.axis = .horizontal
        valuesStackView.spacing = 32
        valuesStackView.alignment = .top
        
        titlesStackView.addArrangedSubview(lengthTitleLabel)
        titlesStackView.addArrangedSubview(languageTitleLabel)
        titlesStackView.addArrangedSubview(ratingTitleLabel)
        
        valuesStackView.addArrangedSubview(lengthValueLabel)
        valuesStackView.addArrangedSubview(languageValueLabel)
        valuesStackView.addArrangedSubview(ratingValueLabel)
        
        parametersStackView.addArrangedSubview(titlesStackView)
        parametersStackView.addArrangedSubview(valuesStackView)
        
        containerView.addSubview(parametersStackView)
        
        NSLayoutConstraint.activate([
            parametersStackView.topAnchor.constraint(equalTo: genresCollectionView.bottomAnchor, constant: 16),
            parametersStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            parametersStackView.widthAnchor.constraint(equalToConstant: 327),
            parametersStackView.heightAnchor.constraint(equalToConstant: 40),
        ])
        
        let titleWidth: CGFloat = 80
        let valueWidth: CGFloat = 80
        
        lengthValueLabel.text = "2h 28min"
        languageValueLabel.text = "English"
        ratingValueLabel.text = "PG-13"
        
        
        lengthTitleLabel.widthAnchor.constraint(equalToConstant: titleWidth).isActive = true
        languageTitleLabel.widthAnchor.constraint(equalToConstant: titleWidth).isActive = true
        ratingTitleLabel.widthAnchor.constraint(equalToConstant: titleWidth).isActive = true
        
        lengthValueLabel.widthAnchor.constraint(equalToConstant: valueWidth).isActive = true
        languageValueLabel.widthAnchor.constraint(equalToConstant: valueWidth).isActive = true
        ratingValueLabel.widthAnchor.constraint(equalToConstant: valueWidth).isActive = true
    }
    
    //description setup
    private func setupDescription() {
        containerView.addSubview(descriptionTitle)
        containerView.addSubview(descriptionLabel)
        
        descriptionLabel.text = "A thrilling story about Spider-Man facing new challenges and discovering unexpected alliances."
        
        
        NSLayoutConstraint.activate([
            descriptionLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -150),
            descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 150),
            
            descriptionTitle.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -12),
            descriptionTitle.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            descriptionTitle.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
        ])
    }
    
    // ეს არის სეტაპი
    private func setupActorsCollectionView() {
        containerView.addSubview(actorsCollectionView)
        actorsCollectionView.register(ActorCell.self, forCellWithReuseIdentifier: ActorCell.reuseIdentifier)
        
        actorsCollectionView.dataSource = self
        actorsCollectionView.delegate = self
        
        NSLayoutConstraint.activate([
            actorsCollectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            actorsCollectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            actorsCollectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -30),
            actorsCollectionView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}

// MARK: - UICollectionViewDataSource

extension DetailsPageVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == genresCollectionView ? genres.count : actors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == genresCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailsPageGenreCell.reuseIdentifier, for: indexPath) as? DetailsPageGenreCell else {
                return UICollectionViewCell()
            }
            cell.configure(with: genres[indexPath.item])
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ActorCell.reuseIdentifier, for: indexPath) as? ActorCell else {
                return UICollectionViewCell()
            }
            cell.configure(with: actors[indexPath.item])
            return cell
        }
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == genresCollectionView {
            let genre = genres[indexPath.item]
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 16)
            label.text = genre
            let size = label.sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude, height: 18))
            return CGSize(width: size.width + 20, height: 30)
        } else {
            return CGSize(width: 90, height: 90)
        }
    }
}

