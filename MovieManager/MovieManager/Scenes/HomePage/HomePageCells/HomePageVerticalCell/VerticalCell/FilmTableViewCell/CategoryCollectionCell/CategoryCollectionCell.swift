//
//  CategoryCollectionCell.swift
//  MovieManager
//
//  Created by Nkhorbaladze on 26.10.24.
//

import UIKit

class CategoryCollectionCell: UICollectionViewCell {
    
    static let identifier = "CategoryCollectionCell"
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(hexString: "88A4E8")
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.selectedBackgroundView = .none
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        contentView.backgroundColor = UIColor(hexString: "DBE3FF")
        contentView.layer.cornerRadius = frame.height / 2
        contentView.layer.masksToBounds = true
        
        contentView.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func setCategory(with category: String) {
        label.text = category
    }
}
