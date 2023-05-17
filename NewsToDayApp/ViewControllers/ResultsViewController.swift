//
//  ResultsViewController.swift
//  playerMusical
//
//  Created by Николай on 09.05.2023.
//

import UIKit
class ResultsViewController: UIViewController {
    
    private lazy var resultImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "resultImage")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var bookMarkButton: FavoriteButton = {
        let button = FavoriteButton(iconPointSize: 21)
        button.addTarget(self, action: #selector(tappedCategoryButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "arrowshape.turn.up.forward"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var categoryView: UIView = {
        let view = UIView()
        view.frame = CGRect()
        view.layer.cornerRadius = 16
        view.backgroundColor = #colorLiteral(red: 0.3483925462, green: 0.4508707523, blue: 0.8743011355, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var categoryLabel: UILabel = {
       let label = UILabel()
        label.text = "Politics"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nameStateLabel: UILabel = {
       let label = UILabel()
        label.text = "The latest situation in the presidential election"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var authorLabel: UILabel = {
       let label = UILabel()
        label.text = "John Doe"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var author: UILabel = {
       let label = UILabel()
        label.text = "Author"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = #colorLiteral(red: 0.6745098039, green: 0.6862745098, blue: 0.7647058824, alpha: 1)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var resultLabel: UILabel = {
       let label = UILabel()
        label.text = "Result"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textLabel: UITextView = {
       let text = UITextView()
        text.text = "Leads in individual states may change from one party to another as all the votes are counted. Select a state for detailed results, and select the Senate, House or Governor tabs to view those races.\n\n\nFor more detailed state results click on the States A-Z links at the bottom of this page. Results source: NEP/Edison via Reuters.\n\n\n Leads in individual states may change from one party to another as all the votes are counted. Select a state for detailed results, and select the Senate, House or Governor tabs to view those races. For more detailed state results click on the States A-Z links at the bottom of this page. Results source: NEP/Edison via Reuters."
        text.font = UIFont.systemFont(ofSize: 16)
        text.textColor = .black
        text.textAlignment = .left
        text.backgroundColor = .clear
        text.textAlignment = .justified
        text.isEditable = false
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    @objc func backButtonTapped () {
            print("back")
    }
    
    @objc func shareButtonTapped () {
        print("share")

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        setConstraints()
        
    }
//    
//     func prepareForReuse() {
//        bookMarkButton.setInactive()
//    }
    
    private func addView () {
        view.backgroundColor = .white
        view.addSubview(resultImage)
        view.addSubview(shareButton)
        view.addSubview(bookMarkButton)
        view.addSubview(backButton)
        view.addSubview(categoryView)
        view.addSubview(categoryLabel)
        view.addSubview(nameStateLabel)
        view.addSubview(authorLabel)
        view.addSubview(author)
        view.addSubview(resultLabel)
        view.addSubview(textLabel)
    }
    
}
//MARK: - Set Constraints
extension ResultsViewController {
    private func setConstraints () {
        NSLayoutConstraint.activate([
            resultImage.topAnchor.constraint(equalTo: view.topAnchor),
            resultImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            resultImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 78),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26),
            
            bookMarkButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 74),
            bookMarkButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            shareButton.topAnchor.constraint(equalTo: bookMarkButton.bottomAnchor, constant: 29),
            shareButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -21),
            
            categoryView.topAnchor.constraint(equalTo: view.topAnchor, constant: 168),
            categoryView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            categoryView.widthAnchor.constraint(equalToConstant: 75),
            categoryView.heightAnchor.constraint(equalToConstant: 32),
            
            categoryLabel.topAnchor.constraint(equalTo: categoryView.topAnchor, constant: 8),
            categoryLabel.leadingAnchor.constraint(equalTo: categoryView.leadingAnchor, constant: 16),
            categoryLabel.widthAnchor.constraint(equalToConstant: 43),
            categoryLabel.heightAnchor.constraint(equalToConstant: 16),
            
            nameStateLabel.topAnchor.constraint(equalTo: categoryView.bottomAnchor, constant: 25),
            nameStateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameStateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            authorLabel.topAnchor.constraint(equalTo: nameStateLabel.bottomAnchor, constant: 26),
            authorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            author.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 2),
            author.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            resultLabel.topAnchor.constraint(equalTo: resultImage.bottomAnchor, constant: 24),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            textLabel.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 10),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -85),

            
        ])
    }
}
extension ResultsViewController {
    @objc func tappedCategoryButton(_ button: FavoriteButton) {
        if button.isFavorite == false {
            button.setActive()
        } else {
            button.setInactive()
        }
    }
}
