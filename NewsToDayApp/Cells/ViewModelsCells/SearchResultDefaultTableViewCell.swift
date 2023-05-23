//
//  SearchResultDefaultTableViewCell.swift
//  NewsToDayApp
//
//  Created by Админ on 19.05.2023.
//

import UIKit

class SearchResultDefaultTableViewCell: UITableViewCell {

    static let identifire = "SearchResultDefaultTableViewCell"
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
    private let autorLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 18, weight: .ultraLight)
        return label
    }()
    
    private let imageCover: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(label)
        contentView.addSubview(imageCover)
        contentView.addSubview(autorLabel)
        
        contentView.backgroundColor = .clear
        contentView.clipsToBounds = true
        
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let imageSize: CGFloat = contentView.height-10
        imageCover.frame = CGRect(
            x: 10,
            y: 5,
            width: imageSize,
            height: imageSize)
        
        imageCover.layer.cornerRadius = imageSize/2
        imageCover.layer.masksToBounds = true
        label.frame = CGRect(
            x: imageCover.right+10,
            y: -20,
            width: contentView.width-imageCover.right-15,
            height: contentView.height)
        
        autorLabel.frame = CGRect(
            x: imageCover.right+10,
            y: 20,
            width: contentView.width-imageCover.right-15,
            height: contentView.height)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageCover.image = nil
        label.text = nil
    }
    
    public func configure(_ with: JustReuseNewsModelView) {
        imageCover.sd_setImage(with: with.imageURL)
        label.text = with.desc
        autorLabel.text = with.autor
    }

}
