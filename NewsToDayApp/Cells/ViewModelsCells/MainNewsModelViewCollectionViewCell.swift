//
//  MainNewsModelViewCollectionViewCell.swift
//  NewsToDayApp
//
//  Created by Админ on 17.05.2023.
//

import UIKit
import SDWebImage

class MainNewsModelViewCollectionViewCell: UICollectionViewCell {
    
    static let identifire = "MainNewsModelViewCollectionViewCell"
    
    private let imageNewsCover: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "photo")
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 10
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let labelNews: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .light)
        return label
    }()
    
    let categoryNewsLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .white
        label.layer.shadowOpacity = 1
        label.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        label.layer.shadowOffset = CGSize(width: 5, height: 5)
        label.layer.shadowRadius = 5
        label.layer.masksToBounds = false
        label.contentMode = .scaleAspectFill
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 20
        contentView.backgroundColor = .secondarySystemBackground
        
        contentView.addSubview(imageNewsCover)
        contentView.addSubview(labelNews)
        contentView.addSubview(categoryNewsLbl)
        
        contentView.clipsToBounds = true
        contentView.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        contentView.layer.borderWidth = 0.1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageNewsCover.frame = contentView.bounds
        categoryNewsLbl.frame = CGRect(x: 10, y: 50 , width: contentView.width , height: contentView.height)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageNewsCover.image = nil
        labelNews.text = nil
        categoryNewsLbl.text = nil
    }
    
    func configureCells(with: JustNewsModelView) {
        imageNewsCover.sd_setImage(with: with.imageURL ?? URL(string: "https://www.antakigppk.com/wp-content/uploads/2020/05/csm_Corporate-News_final_8c49c960ec.jpg"))
        //labelNews.text = with.newsCateg
        categoryNewsLbl.text = with.newsCateg
    }
    
    
}

