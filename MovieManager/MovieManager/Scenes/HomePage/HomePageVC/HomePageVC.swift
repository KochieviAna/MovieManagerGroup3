import UIKit

final class HomePageVC: UIViewController {
    private lazy var homePageTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(HorisontalCell.self, forCellReuseIdentifier: "HorisontalCell")
        tableView.register(FilmTableViewCell.self, forCellReuseIdentifier: FilmTableViewCell.identifier)
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
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
    
    private func setupHomePageTableViewConstraints() {
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
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return homePageViewModel.getPopularMovies().count
        }
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
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "HorisontalCell", for: indexPath) as? HorisontalCell else { return UITableViewCell() }
            cell.delegate = self
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FilmTableViewCell.identifier, for: indexPath) as? FilmTableViewCell else { return UITableViewCell() }
            
            let movie = homePageViewModel.getPopularMovies()[indexPath.row]
            cell.configure(with: movie)

            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentIndex = indexPath.row
        
        if indexPath.section == 0 {
            return
        } else if indexPath.section == 1 {
            let vc = DetailsPageVC()
            vc.hidesBottomBarWhenPushed = true
            vc.film = homePageViewModel.getPopularFilm(at: currentIndex)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 350 : 140
    }
}

extension HomePageVC: HorisontalCellDelegate {
    func horisontalCellDidSelectItem(at indexPath: IndexPath) {
        let currentIndex = indexPath.row
        
        let vc = DetailsPageVC()
        vc.hidesBottomBarWhenPushed = true
        vc.film = homePageViewModel.getNowShowingFilm(at: currentIndex)
        navigationController?.pushViewController(vc, animated: true)
    }
}


