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
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        //label.tintColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 20
        contentView.backgroundColor = #colorLiteral(red: 0.2784313725, green: 0.3529411765, blue: 0.8431372549, alpha: 1)
        contentView.addSubview(categoryNewsLbl)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        categoryNewsLbl.frame = CGRect(x: 10, y: 0 , width: contentView.width , height: contentView.height)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        categoryNewsLbl.text = nil
    }
    
    
}

