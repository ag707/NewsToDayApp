//
//  BookmarksViewController.swift
//  NewsToDayApp
//
//  Created by Админ on 18.05.2023.
//

import UIKit

class BookmarksViewController: UIViewController {
    
    // заглушка - при пустом значении показывается текст о добавлении закладок. При наличии значении - показывает ячейки
    private let bookmarks: [JustReuseNewsModelView] = []
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Bookmarks"
        label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondaryHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Saved articles to the library"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(BookmarkTableViewCell.self, forCellReuseIdentifier: "cellID")
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let backgroundView: UIView = {
        let background = UIView()
        background.backgroundColor = .tertiaryLabel
        background.layer.cornerRadius = 50
        background.alpha = 0.5
        return background
    }()

    
    private let bookmarkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "book.closed")
        imageView.tintColor = .blue
        imageView.alpha = 1
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let bannerLabel: UILabel = {
        let label = UILabel()
        label.text = "You haven't saved any articles yet. \nStart reading and bookmarking them now"
        label.numberOfLines = 0
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.setContentHuggingPriority(.required, for: .vertical)
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var emptyStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [backgroundView, bookmarkImageView, bannerLabel])
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        bookmarkImageView.frame = backgroundView.bounds
        backgroundView.addSubview(bookmarkImageView)
        
        bookmarkImageView.widthAnchor.constraint(equalToConstant: 35).isActive = true
        bookmarkImageView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        bookmarkImageView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
        bookmarkImageView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor).isActive = true
        backgroundView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        backgroundView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        setConstraints()
        checkIfEmpty()
    }
    
    private func checkIfEmpty() {
        bookmarks.isEmpty
        ? (emptyStackView.isHidden = false)
        : (emptyStackView.isHidden = true)
    }
    
    private func addSubviews() {
        view.addSubview(headerLabel)
        view.addSubview(secondaryHeaderLabel)
        view.addSubview(tableView)
//        view.addSubview(bannerLabel)
        view.addSubview(emptyStackView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            headerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            secondaryHeaderLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 10),
            secondaryHeaderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            tableView.topAnchor.constraint(equalTo: secondaryHeaderLabel.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            emptyStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            emptyStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

        ])
    }
}

extension BookmarksViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        bookmarks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellID") as? BookmarkTableViewCell else { return UITableViewCell() }
        // после подключения сетевого слоя - доставать атрибуты модельки Bookmarks
        //        let type = bookmarks[indexPath.row]
        //        let primaryText = type.primaryText
        cell.configure(primaryText: "test", secondaryText: "test", image: UIImage(systemName: "xmark.circle") ?? UIImage())
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height / 7
    }
}
