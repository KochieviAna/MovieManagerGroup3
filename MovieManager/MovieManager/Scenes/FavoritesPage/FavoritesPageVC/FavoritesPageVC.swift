//
//  FavoritesPageView.swift
//  MovieManager
//
//  Created by Nkhorbaladze on 25.10.24.
//

import UIKit

final class FavoritesPageVC: UIViewController {
    
    private lazy var moviesCollectionView: UICollectionView = {
        let collection: UICollectionView
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .vertical
        collectionLayout.itemSize = CGSize(width: 180, height: 270)
        collection = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        return collection
    }()
            
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        
        view.addSubview(moviesCollectionView)
        
        moviesCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        moviesCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        moviesCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        moviesCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        moviesCollectionView.dataSource = self
        moviesCollectionView.delegate = self
        
        moviesCollectionView.register(FavoritesPageCell.self, forCellWithReuseIdentifier: FavoritesPageCell.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        moviesCollectionView.reloadData()
    }
}

extension FavoritesPageVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        MovieManager.shared.getFavorites().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoritesPageCell.identifier, for: indexPath) as? FavoritesPageCell else {
           return  UICollectionViewCell()
        }
        let currentFilm = MovieManager.shared.getFavorites(at: indexPath.row )
        
        cell.configure(with: currentFilm)
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentFilm = MovieManager.shared.getFavorites(at: indexPath.row )
        
        let vc = DetailsPageVC()
        
        vc.hidesBottomBarWhenPushed = true
        vc.film = currentFilm
        vc.reloadData = { [weak self] in
            self?.moviesCollectionView.reloadData()
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
