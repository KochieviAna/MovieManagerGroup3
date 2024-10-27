//
//  VerticalCell.swift
//  MovieManager
//
//  Created by MacBook on 26.10.24.
//

import UIKit

class VerticalCell: UITableViewCell {
    
    private lazy var filmTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(FilmTableViewCell.self, forCellReuseIdentifier: FilmTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
            
        return tableView
    }()
    
    private let verticalCellViewModel = VerticalCellViewModel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(filmTableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            filmTableView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            filmTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            filmTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            filmTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
    }

}
// MARK: - Extensions

extension VerticalCell: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FilmTableViewCell.identifier, for: indexPath) as? FilmTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(withDataSource: self, delegate: self)
        return cell
    }
}

extension VerticalCell: UITableViewDelegate { }

// MARK: - Collection View Delegate and Data Source

extension VerticalCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionCell.identifier, for: indexPath) as! CategoryCollectionCell

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 65, height: 25)
    }
}
