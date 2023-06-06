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
    var isFavorite: Bool?
    var categories = ["Covid-19","Sports","Politics","Life","Gaming","Animals","Nature","Food","Art","History"]
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 300, height: 200))
        setTitle(getNextWord(), for: .normal)
        setTitleColor(.categoriesLabel, for: .normal)
        
        tintColor = .black
        layer.cornerRadius = 16
        backgroundColor = .categoryButtonColor
        isFavorite = false
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setActive() {
        //        setImage(UIImage(systemName: "bookmark.fill", withConfiguration: iconConfiguration), for: .normal)
        backgroundColor = .blueButtonColor
        setTitleColor(UIColor.white, for: .normal)
        isFavorite = true
        print(isFavorite as Any)
        
    }
    
    func setInactive() {
        //        setImage(UIImage(systemName: "bookmark", withConfiguration: iconConfiguration), for: .normal)
        backgroundColor = .categoryButtonColor
        setTitleColor(UIColor.categoriesLabel, for: .normal)

        isFavorite = false
        print(isFavorite as Any)
        
    }
    
    func getNextWord() -> String? {
        let wordArray = categories
        struct Counter {
            static var currentIndex = 0
        }
        
        let currentIndex = Counter.currentIndex
        guard currentIndex < wordArray.count else {
            return nil
        }
        
        let nextIndex = currentIndex + 1
        Counter.currentIndex = nextIndex
        
        return wordArray[currentIndex]
    }
}
