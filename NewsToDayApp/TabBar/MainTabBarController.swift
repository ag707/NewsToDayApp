//
//  ViewController.swift
//  playerMusical
//
//  Created by Николай on 26.04.2023.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = MainNewsViewController()
        let vc2 = CategoryViewControllerL()
        let vc3 = BookmarksViewController()
        let vc4 = ProfileViewController()
        
        vc1.title = "Main News"
        //        vc2.title = "Category"
        //        vc3.title = "BookMarks"
        //        vc4.title = "Profile"
        
        //        vc1.navigationItem.largeTitleDisplayMode = .always
        //        //vc2.navigationItem.largeTitleDisplayMode = .always
        //        vc3.navigationItem.largeTitleDisplayMode = .always
        //        vc4.navigationItem.largeTitleDisplayMode = .always
        
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
        let nav4 = UINavigationController(rootViewController: vc4)
        
        nav1.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "house"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "category"), tag: 1)
        nav3.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "saved"), tag: 1)
        nav4.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "human"), tag: 1)
        
        //        nav1.navigationBar.prefersLargeTitles = true
        //        nav2.navigationBar.prefersLargeTitles = true
        //        nav3.navigationBar.prefersLargeTitles = true
        //        nav4.navigationBar.prefersLargeTitles = true
        
        nav1.navigationBar.tintColor = .label
        nav2.navigationBar.tintColor = .label
        nav3.navigationBar.tintColor = .label
        nav4.navigationBar.tintColor = .label
        
        setViewControllers([nav1,nav3,nav4], animated: false)
    }
}

