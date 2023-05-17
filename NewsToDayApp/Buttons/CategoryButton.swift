//
//  CategoryButton.swift
//  NewsToDayApp
//
//  Created by Николай on 16.05.2023.
//

import UIKit

protocol CategoryButtonTapped {
    func tappedFavoriteButton(_ sender: FavoriteButton, recipeID: Int)
    
}

class CategoryButton: UIButton {
    private var iconConfiguration: UIImage.SymbolConfiguration!
    private var defaultColor: UIColor!
    var isFavorite: Bool?
    var categories = ["Covid-19","Sports","Politics","Life","Gaming","Animals","Nature","Food","Art","History"]
    
    init(iconPointSize: CGFloat = 35, withColor color: UIColor = .mainWhite) {
        super.init(frame: .zero)
        
        iconConfiguration = UIImage.SymbolConfiguration(pointSize: iconPointSize, weight: .medium, scale: .medium)
        setTitle(categories.randomElement(), for: .normal)
        setTitleColor(UIColor.black, for: .normal)
        self.defaultColor = color
        tintColor = .black
        isFavorite = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setActive() {
        setImage(UIImage(systemName: "bookmark.fill", withConfiguration: iconConfiguration), for: .normal)
        titleLabel?.textColor = .red
        isFavorite = true
        
    }
    
    func setInactive() {
        setImage(UIImage(systemName: "bookmark", withConfiguration: iconConfiguration), for: .normal)
        tintColor = .black
        isFavorite = false
        
    }
}

