//
//  FavoriteButton.swift
//  NewsToDayApp
//
//  Created by Николай on 16.05.2023.
//

import UIKit

protocol FavorieteButtonTapped {
    func tappedFavoriteButton(_ sender: FavoriteButton)

}

class FavoriteButton: UIButton {
    private var iconConfiguration: UIImage.SymbolConfiguration!
    private var defaultColor: UIColor!
    var isFavorite: Bool?
    var delegete: FavorieteButtonTapped?
    init(iconPointSize: CGFloat = 35, withColor color: UIColor = .mainWhite) {
        super.init(frame: .zero)
        
        iconConfiguration = UIImage.SymbolConfiguration(pointSize: iconPointSize, weight: .medium, scale: .medium)
        let image = UIImage(systemName: "bookmark", withConfiguration: iconConfiguration)
        setImage(image, for: .normal)
        self.defaultColor = color
        tintColor = .white
        isFavorite = false
        addTarget(self, action: #selector(bookMarkTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setActive() {
        setImage(UIImage(systemName: "bookmark.fill", withConfiguration: iconConfiguration), for: .normal)
        tintColor = .white
        isFavorite = true

    }
    
    func setInactive() {
        setImage(UIImage(systemName: "bookmark", withConfiguration: iconConfiguration), for: .normal)
        tintColor = .white
        isFavorite = false

    }
    
    @objc func bookMarkTapped() {
        delegete?.tappedFavoriteButton(self)
        print("334")
    }
    
    
}

