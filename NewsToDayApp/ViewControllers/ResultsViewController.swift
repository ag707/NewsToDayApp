//
//  ResultsViewController.swift
//  playerMusical
//
//  Created by Николай on 09.05.2023.
//

import UIKit
import SDWebImage

class ResultsViewController: UIViewController {
    
    var newsBucket = [JustReuseNewsModelView]()
    
    private lazy var resultImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "resultImage")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
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
        label.font = .systemFont(ofSize: 12, weight: .regular)
        //label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nameStateLabel: UILabel = {
       let label = UILabel()
        label.layer.shadowOpacity = 1
        label.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        label.layer.shadowOffset = CGSize(width: 5, height: 5)
        label.layer.shadowRadius = 5
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        //label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var authorLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        //label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var author: UILabel = {
       let label = UILabel()
        label.text = "Author"
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = #colorLiteral(red: 0.6745098039, green: 0.6862745098, blue: 0.7647058824, alpha: 1)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var resultLabel: UILabel = {
       let label = UILabel()
        label.text = "Result"
        label.font = .systemFont(ofSize: 20, weight: .regular)
        //label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textLabel: UITextView = {
       let text = UITextView()
        text.font = .systemFont(ofSize: 15, weight: .regular)
        //text.textColor = .black
        text.textAlignment = .left
        text.backgroundColor = .clear
        text.textAlignment = .justified
        text.isEditable = false
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
        
    @objc func shareButtonTapped () {
        guard let url = URL(string: newsBucket.first?.url  ?? "") else {
            return
        }
        print(url)
        let vc = UIActivityViewController(
            activityItems: [url],
            applicationActivities: [])
        
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setBlurView()
        addView()
        setConstraints()
    }
//    
//     func prepareForReuse() {
//        bookMarkButton.setInactive()
//    }
    
    private  func setBlurView() {
        let blurView = UIVisualEffectView()
        blurView.frame = view.bounds
        blurView.effect = UIBlurEffect(style: .light)
        view.addSubview(blurView)
        blurView.contentView.addSubview(textLabel)
    }
    
    private func addView () {
        view.backgroundColor = .systemBackground
        view.addSubview(resultImage)
        view.addSubview(shareButton)
        view.addSubview(bookMarkButton)
        view.addSubview(categoryView)
        view.addSubview(categoryLabel)
        view.addSubview(nameStateLabel)
        view.addSubview(authorLabel)
        view.addSubview(author)
        view.addSubview(resultLabel)
        view.addSubview(textLabel)
    }
    
    
    
    public func configureResultVc(with model: JustReuseNewsModelView) {
        newsBucket = [model]
        resultImage.sd_setImage(with: model.imageURL ?? URL(string: Constants.stockImage))
        textLabel.text = model.mainNews
        categoryLabel.text = model.newsCateg
        nameStateLabel.text = model.nameState
        author.text = model.autor
        authorLabel.text = model.autor
        resultLabel.text = model.newsCateg
    }
    
}
//MARK: - Set Constraints
extension ResultsViewController {
    private func setConstraints () {
        NSLayoutConstraint.activate([
            resultImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            resultImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            resultImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            resultImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -500),
            
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
extension ResultsViewController: FavorieteButtonTapped {
    func tappedFavoriteButton(_ sender: FavoriteButton) {
        print("erer")
    }
    
    @objc func tappedCategoryButton(_ button: FavoriteButton) {
        button.bookMarkTapped()
        if button.isFavorite == false {
            button.setActive()
        } else {
            button.setInactive()
        }
    }
}
