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
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.contentMode = .scaleAspectFill
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
        contentView.backgroundColor = .secondarySystemBackground
        contentView.layer.cornerRadius = 10
        contentView.addSubview(newsNameLbl)
        contentView.addSubview(newsCoverImage)
        contentView.addSubview(newsSourceLbl)
        
        contentView.clipsToBounds = true
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
        
        newsCoverImage.frame = CGRect(x: 5, y: 5, width: imageSize, height: imageSize)
        
        //let albumLabelHeight = min(20, newsSourceLbl.height)
        
        newsNameLbl.frame = CGRect(
            x: newsCoverImage.right+10 ,
            y: 5,
            width: albumLAbelSize.width ,
            height: newsSourceLbl.height)
        
        newsSourceLbl.frame = CGRect(
            x: newsCoverImage.right+10 ,
            y: newsNameLbl.bottom+30,
            width: contentView.width - newsCoverImage.right-10 ,
            height: 30)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        newsNameLbl.text = nil
        newsSourceLbl.text = nil
        newsCoverImage.image = nil
    }
    
    func configure(with model: JustNewsModelView ) {
        newsNameLbl.text = model.mainNews
        newsSourceLbl.text = model.newsCateg
        newsCoverImage.sd_setImage(with: model.imageURL ?? URL(string: Constants.stockImage))
    }
}

