//
//  SceneDelegate.swift
//  MovieManager
//
//  Created by Nkhorbaladze on 25.10.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)

        let tabBarController = UITabBarController()
        
        let mainVC = HomePageVC()
        mainVC.title = "MovieMan"
        let favoritesVC = FavoritesPageVC()
        favoritesVC.title = "Favorites"
        
        let mainNavigationController = UINavigationController(rootViewController: mainVC)
        let favoritesNavigationController = UINavigationController(rootViewController: favoritesVC)
        
        mainNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Bookmark")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "BookmarkFocused")?.withRenderingMode(.alwaysOriginal))
        
        favoritesNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Favorites")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "FavoritesFocused")?.withRenderingMode(.alwaysOriginal))
        
        tabBarController.viewControllers = [mainNavigationController, favoritesNavigationController]
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
}

