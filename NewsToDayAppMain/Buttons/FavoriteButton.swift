//
//  FavoriteButton.swift
//  NewsToDayApp
//
//  Created by Николай on 16.05.2023.
//

import UIKit

class FavoriteButton: UIButton {
    private var iconConfiguration: UIImage.SymbolConfiguration!
    private var defaultColor: UIColor!
    var isFavorite: Bool?
    init(iconPointSize: CGFloat = 35, withColor color: UIColor = .mainWhite) {
        super.init(frame: .zero)
        
        iconConfiguration = UIImage.SymbolConfiguration(pointSize: iconPointSize, weight: .medium, scale: .medium)
        let image = UIImage(systemName: "bookmark", withConfiguration: iconConfiguration)
        setImage(image, for: .normal)
        self.defaultColor = color
        tintColor = .white
        isFavorite = false
        
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 3
        layer.masksToBounds = false
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
    
    
}

