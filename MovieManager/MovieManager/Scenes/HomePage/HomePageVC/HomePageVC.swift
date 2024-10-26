//
//  HomePageVC.swift
//  MovieManager
//
//  Created by Nkhorbaladze on 25.10.24.
//

import UIKit

final class HomePageVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let detailsButton = UIButton(type: .system)
        detailsButton.setTitle("Go to Details", for: .normal)
        detailsButton.backgroundColor = .systemBlue
        detailsButton.setTitleColor(.white, for: .normal)
        detailsButton.layer.cornerRadius = 8
        detailsButton.addAction(UIAction(handler: { [weak self] action in self?.navigateToDetailsPage()}), for: .touchUpInside)

        
        detailsButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(detailsButton)
        
        NSLayoutConstraint.activate([
            detailsButton.widthAnchor.constraint(equalToConstant: 120),
            detailsButton.heightAnchor.constraint(equalToConstant: 40),
            detailsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailsButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    // Action to push DetailsPageVC
    private func navigateToDetailsPage() {
        let detailsPageVC = DetailsPageVC()
        detailsPageVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(detailsPageVC, animated: true)
    }
}

