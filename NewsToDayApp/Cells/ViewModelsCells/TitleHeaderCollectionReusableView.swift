//
//  TitleHeaderCollectionReusableView.swift
//  NewsToDayApp
//
//  Created by Borisov Nikita on 17.05.2023.
//

import UIKit

class TitleHeaderCollectionReusableView: UICollectionReusableView {
    
    static let identifire = "TitleHeaderCollectionReusableView"
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .thin)
        label.numberOfLines = 1
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.1215686275, green: 0.3411764706, blue: 0.4078431373, alpha: 0.1537726194)
        layer.cornerRadius = 17
        layer.shadowOpacity = 5
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        layer.shadowOffset = CGSize(width: -5, height: 0)
        layer.shadowRadius = 3
        layer.masksToBounds = false
        addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with title: String) {
        label.text = title
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = CGRect(x: 10, y: 0, width: width-30, height: height)
    }
}

