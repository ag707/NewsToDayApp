//
//  CategoryViewController.swift
//  NewsToDayApp
//
//  Created by Николай on 16.05.2023.
//

import UIKit

final class CategoryViewControllerL: UIViewController {
    
    private lazy var categoriesLabal: UILabel = {
        let label = UILabel()
        label.text = "Categories"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var categoriesLabel: UILabel = {
        let label = UILabel()
        label.text = "Thousands of articles in each category"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .categoriesLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Создание первого столбца
    private lazy var column1StackView: UIStackView = {
        let stack1 = UIStackView()
        stack1.axis = .vertical
//        stack1.distribution = .fillEqually
        stack1.spacing = 20
        
        for _ in 1...5 {
            let button = CategoryButton()
            button.heightAnchor.constraint(equalToConstant: 72).isActive = true
            button.widthAnchor.constraint(equalToConstant: 160).isActive = true
            button.addTarget(self, action: #selector(tappedCategoryButton), for: .touchUpInside)
            stack1.addArrangedSubview(button)
        }
        return stack1
    }()
    // Создание второго столбца
    private lazy var column2StackView: UIStackView = {
        let stack2 = UIStackView()
        stack2.axis = .vertical
        stack2.distribution = .fillEqually
        stack2.spacing = 20
        for _ in 1...5 {
            let button = CategoryButton()
            button.heightAnchor.constraint(equalToConstant: 72).isActive = true
            button.widthAnchor.constraint(equalToConstant: 160).isActive = true
            button.addTarget(self, action: #selector(tappedCategoryButton), for: .touchUpInside)
            stack2.addArrangedSubview(button)
        }
        return stack2
    }()
    // Создание контейнера для столбцов
    private lazy var containerView: UIStackView = {
        let container = UIStackView()
        container.axis = .horizontal
        container.distribution = .fillEqually
        container.spacing = 20
        container.addArrangedSubview(column1StackView)
        container.addArrangedSubview(column2StackView)
        
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blueButtonColor
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(tappedNextButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(categoriesLabal)
        view.addSubview(categoriesLabel)
        view.addSubview(containerView)
        view.addSubview(nextButton)
    }
}

extension CategoryViewControllerL {
    private func setConstraints () {
        NSLayoutConstraint.activate([
            
            categoriesLabal.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            categoriesLabal.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            categoriesLabel.topAnchor.constraint(equalTo: categoriesLabal.bottomAnchor, constant: 10),
            categoriesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
           
            containerView.topAnchor.constraint(equalTo: categoriesLabel.bottomAnchor, constant: 20),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -140),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nextButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
}

extension CategoryViewControllerL {
    @objc func tappedCategoryButton(_ button: CategoryButton) {
        if button.isFavorite == false {
            button.setActive()

        } else {
            button.setInactive()

        }
    }
}

extension CategoryViewControllerL {
    @objc func tappedNextButton() {
    print("next")
    }
}
