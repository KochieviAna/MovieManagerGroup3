//
//  HomePageVC.swift
//  MovieManager
//
//  Created by Nkhorbaladze on 25.10.24.
//

import UIKit

final class HomePageVC: UIViewController {
    private lazy var homePageTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(HorisontalCell.self, forCellReuseIdentifier: "HorisontalCell")
        tableView.register(VerticalCell.self, forCellReuseIdentifier: "VerticalCell")
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    let homePageViewModel = HomePageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground


        setupUI()
    }
    
    private func setupUI() {
        setupHomePageTableViewConstraints()
    }
    
    private func setupHomePageTableViewConstraints(){
        view.addSubview(homePageTableView)
        
        NSLayoutConstraint.activate([
            homePageTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            homePageTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            homePageTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            homePageTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension HomePageVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Now Showing" : "Popular"
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = UIFont(name: "Merriweather-Bold", size: 16)
        header.textLabel?.textColor = UIColor(hexString: "110E47")
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0, let cell = tableView.dequeueReusableCell(withIdentifier: "HorisontalCell", for: indexPath) as? HorisontalCell {
            return cell
        } else if indexPath.section == 1, let cell = tableView.dequeueReusableCell(withIdentifier: "VerticalCell", for: indexPath) as? VerticalCell {
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        350
    }
}

