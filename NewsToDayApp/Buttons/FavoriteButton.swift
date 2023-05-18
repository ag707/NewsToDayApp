//
//  FavoriteButton.swift
//  NewsToDayApp
//
//  Created by Николай on 16.05.2023.
//

import UIKit

protocol FavoriteButtonDelegate: AnyObject {
    func tappedFavoriteButton(_ sender: FavoriteButton, recipeID: Int)
}

class FavoriteButton: UIButton {

    var isFavorite: Bool?
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    
        let image = UIImage(systemName: "bookmark")
        setImage(image, for: .normal)
        tintColor = .white
        isFavorite = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setActive() {
        setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
        isFavorite = true

        print("1")

    }
    
    func setInactive() {
        setImage(UIImage(systemName: "bookmark"), for: .normal)
        isFavorite = false
        print("2")

    }
}

