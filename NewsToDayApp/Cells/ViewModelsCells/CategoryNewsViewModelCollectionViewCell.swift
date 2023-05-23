//
//  CategoryNewsViewModelCollectionViewCell.swift
//  NewsToDayApp
//
//  Created by Админ on 17.05.2023.
//

import UIKit

class CategoryNewsViewModelCollectionViewCell: UICollectionViewCell {
    
    public static let identifier = "CategoryNewsViewModelCollectionViewCell"
    
    let categoryNewsLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.contentMode = .scaleToFill
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 20
        contentView.backgroundColor = .blueButtonColor
        contentView.addSubview(categoryNewsLbl)
        
        contentView.layer.shadowOpacity = 5
        contentView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        contentView.layer.shadowOffset = CGSize(width: -5, height: 0)
        contentView.layer.shadowRadius = 3
        contentView.layer.masksToBounds = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        categoryNewsLbl.frame = CGRect(x: 15, y: 0 , width: contentView.width , height: contentView.height)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        categoryNewsLbl.text = nil
    }
    
    
}

