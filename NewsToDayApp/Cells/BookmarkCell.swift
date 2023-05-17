//
//  BookmarkCell.swift
//  NewsToDayApp
//
//  Created by Damir Zaripov on 17.05.2023.
//

import UIKit

class BookmarkCell: UITableViewCell {
    let customTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(customTextLabel)

        NSLayoutConstraint.activate([
            customTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            customTextLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            customTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            customTextLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
