//
//  HorisontalCell.swift
//  MovieManager
//
//  Created by MacBook on 26.10.24.
//

import UIKit

final class HorisontalCell: UITableViewCell {
    
    private lazy var filmCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 16
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(FilmCollectionViewCell.self, forCellWithReuseIdentifier: "FilmCollectionViewCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    private let homePageViewModel = HomePageViewModel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setUpUI() {
        contentView.addSubview(filmCollectionView)
    }
    
    private func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            filmCollectionView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            filmCollectionView.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor),
            filmCollectionView.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor),
            filmCollectionView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension HorisontalCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        homePageViewModel.getNowShowingMovies().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilmCollectionViewCell", for: indexPath) as? FilmCollectionViewCell else {
            return UICollectionViewCell()
        }
        let currentFilm = homePageViewModel.getNowShowingMovies()[indexPath.row]
        
        cell.configureHorisontalCell(film: currentFilm)
        
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        <#code#>
//    }
}

extension HorisontalCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        
        let totalSpacing: CGFloat = 32
        let cellWidth = (collectionViewWidth - totalSpacing) / 2
        let cellHeight: CGFloat = 283
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
