//
//  SearchResultsViewController.swift
//  NewsToDayApp
//
//  Created by Админ on 17.05.2023.
//

import Foundation
import UIKit


class SearchResultsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBlurView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    private  func setBlurView() {
        let blurView = UIVisualEffectView()
        blurView.frame = view.frame
        blurView.effect = UIBlurEffect(style: .light)
        view.addSubview(blurView)
    }
}
