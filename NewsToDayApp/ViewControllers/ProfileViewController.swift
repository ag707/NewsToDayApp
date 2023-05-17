//
//  Profile.swift
//  playerMusical
//
//  Created by Николай on 09.05.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    private lazy var profileLabel: UILabel = {
        let label = UILabel()
        label.text = "Profile"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = ["Dev P","Nik S","Adgar O"].randomElement()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = ["dev@gmail.com","1@mail.ru","xxx@gamail.con"].randomElement()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = #colorLiteral(red: 0.4862745098, green: 0.5098039216, blue: 0.631372549, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var profileImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "profileImage")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    private lazy var buttonLanguage: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 16
        button.setTitle("Language", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.4862745098, green: 0.5098039216, blue: 0.631372549, alpha: 1), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9568627451, blue: 0.9647058824, alpha: 1)
        button.contentHorizontalAlignment = .left
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(languageTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var buttonTerms: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 16
        button.setTitle("Terms & Conditions", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.4862745098, green: 0.5098039216, blue: 0.631372549, alpha: 1), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9568627451, blue: 0.9647058824, alpha: 1)
        button.contentHorizontalAlignment = .left
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(termsTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var buttonSignOut: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 16
        button.setTitle("Sign Out", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.4862745098, green: 0.5098039216, blue: 0.631372549, alpha: 1), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9568627451, blue: 0.9647058824, alpha: 1)
        button.contentHorizontalAlignment = .left
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(signOut), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var checkImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "chevron.right")
        image.tintColor = #colorLiteral(red: 0.4862745098, green: 0.5098039216, blue: 0.631372549, alpha: 1)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var checkImage2: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "chevron.right")
        image.tintColor = #colorLiteral(red: 0.4862745098, green: 0.5098039216, blue: 0.631372549, alpha: 1)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    private lazy var signOutImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "ipad.and.arrow.forward")
        image.tintColor = #colorLiteral(red: 0.4862745098, green: 0.5098039216, blue: 0.631372549, alpha: 1)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        setConstraints()
    }
    
    private func addView () {
        view.backgroundColor = .white
        view.addSubview(buttonTerms)
        view.addSubview(buttonLanguage)
        view.addSubview(buttonSignOut)
        view.addSubview(profileLabel)
        view.addSubview(nameLabel)
        view.addSubview(emailLabel)
        view.addSubview(profileImage)
        view.addSubview(checkImage)
        view.addSubview(signOutImage)
        view.addSubview(checkImage2)
    }
    
    @objc func languageTapped() {
        
    }
    
    @objc func termsTapped () {
        let terms = TermsAndConditions()
        present(terms, animated: true)
        
    }
    
    @objc func signOut () {
        
    }
}

extension ProfileViewController {
    private func setConstraints () {
        NSLayoutConstraint.activate([
            
            profileLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 72),
            profileLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            
            profileImage.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 22),
            profileImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 135),
            nameLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 24),
            
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2),
            emailLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 24),
            
            buttonLanguage.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 44),
            buttonLanguage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonLanguage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            buttonLanguage.heightAnchor.constraint(equalToConstant: 55),
            
            buttonTerms.bottomAnchor.constraint(equalTo: buttonSignOut.topAnchor, constant: -28),
            buttonTerms.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonTerms.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            buttonTerms.heightAnchor.constraint(equalToConstant: 55),
            
            buttonSignOut.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -124),
            buttonSignOut.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonSignOut.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            buttonSignOut.heightAnchor.constraint(equalToConstant: 55),
            
            checkImage.topAnchor.constraint(equalTo: buttonLanguage.topAnchor, constant: 16),
            checkImage.trailingAnchor.constraint(equalTo: buttonLanguage.trailingAnchor, constant: -23),
            
            checkImage2.topAnchor.constraint(equalTo: buttonTerms.topAnchor, constant: 16),
            checkImage2.trailingAnchor.constraint(equalTo: buttonTerms.trailingAnchor, constant: -23),
            
            signOutImage.topAnchor.constraint(equalTo: buttonSignOut.topAnchor, constant: 16),
            signOutImage.trailingAnchor.constraint(equalTo: buttonSignOut.trailingAnchor, constant: -23),
            
        ])
    }
}


