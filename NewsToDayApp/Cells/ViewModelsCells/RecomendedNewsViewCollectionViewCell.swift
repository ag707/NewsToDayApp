//
//  RecomendedNewsViewCollectionViewCell.swift
//  NewsToDayApp
//
//  Created by Админ on 17.05.2023.
//

import UIKit
import SDWebImage

class RecomendedNewsViewCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TopHeadLineNewsViewCollectionViewCell"
    
    private let newsNameLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15, weight: .regular)
        //label.contentMode = .left
        return label
    }()
    
    private let newsCoverImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo")
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
        
        return imageView
    }()
    
    private let newsSourceLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .thin)
        label.contentMode = .scaleAspectFill
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemBackground
        contentView.layer.cornerRadius = 10
        contentView.addSubview(newsNameLbl)
        contentView.addSubview(newsCoverImage)
        contentView.addSubview(newsSourceLbl)
        
        contentView.clipsToBounds = true
//        contentView.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
//        contentView.layer.borderWidth = 0.1
        
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
        let imageSize: CGFloat = contentView.height-10
        let albumLAbelSize = newsNameLbl.sizeThatFits(CGSize(
            width: contentView.width-imageSize-10, height: contentView.height-10))
        
        newsSourceLbl.sizeToFit()
        newsNameLbl.sizeToFit()
        newsCoverImage.frame = CGRect(x: 5, y: 5, width: imageSize, height: imageSize)
        
        newsNameLbl.frame = CGRect(
            x: newsCoverImage.right+10 ,
            y: contentView.top+2,
            width: contentView.width-5 - newsCoverImage.right-10 ,
            height: 50)
        
        newsSourceLbl.frame = CGRect(
            x: newsCoverImage.right+10 ,
            y: contentView.bottom-35,
            width: contentView.width - newsCoverImage.right-10 ,
            height: 30)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        newsNameLbl.text = nil
        newsSourceLbl.text = nil
        newsCoverImage.image = nil
    }
    
    func configure(with model: JustReuseNewsModelView ) {
        newsNameLbl.text = model.desc
        newsSourceLbl.text = model.newsCateg
        newsCoverImage.sd_setImage(with: model.imageURL ?? URL(string: Constants.stockImage))
    }
}

