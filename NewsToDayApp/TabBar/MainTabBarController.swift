//
//  ViewController.swift
//  playerMusical
//
//  Created by Николай on 26.04.2023.
//

import UIKit

class MainTabBarController: UITabBarController {
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        tabBar.frame.size.height = 75
//        tabBar.frame.origin.y = view.frame.height - 75
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
//        setTabBarAppearance()
    }
    private func generateTabBar () {
        viewControllers = [
            generateVC(vc: ResultsViewController(), image: UIImage(named: "house")),
            generateVC(vc: CategoryViewControllerL(), image: UIImage(named: "category")),
            generateVC(vc: ViewController(), image: UIImage(named: "saved")),
            generateVC(vc: ProfileViewController(),image: UIImage(named: "human")),

        ]
    }
    private func generateVC (vc: UIViewController, image: UIImage?) -> UIViewController {
        vc.tabBarItem.title = title
        vc.tabBarItem.image = image
        return vc
    }
    
//    private func setTabBarAppearance () {
//        let positionOnx: CGFloat = 10
//        let positionOnY: CGFloat = 14
//        let width = tabBar.bounds.width - positionOnx * 2
//        let height = tabBar.bounds.height  + positionOnY * 2
//
//        let roundLayer = CAShapeLayer()
//
//        let bezierPath = UIBezierPath(roundedRect: CGRect(x: positionOnx, y: tabBar.bounds.minY - positionOnY, width: width, height: height), cornerRadius: height / 2)
//        roundLayer.path = bezierPath.cgPath
//
//        tabBar.layer.insertSublayer(roundLayer, at: 0)
//
//        tabBar.itemWidth = width / 5
//        tabBar.itemPositioning = .centered
//
//        roundLayer.fillColor = UIColor.mainWhite.cgColor
//        tabBar.tintColor = .tabBarItemAccent
//        tabBar.unselectedItemTintColor = .tabBarItemLight
//    }
}

