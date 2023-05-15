//
//  Terms&Conditions.swift
//  NewsToDayApp
//
//  Created by Tatiana Zudina on 11.05.2023.
//

import UIKit

class TermsAndConditions: UIViewController {
	
	private let scrollView = UIScrollView()
	private let contentView = UIView()
	private let label = UILabel()
	private let rules = UILabel()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		setupLayout()
	}
	
}

private extension TermsAndConditions {
	func setupLayout() {
		configureScrollView()
		configureContentView()
		prepareScrollView()
		configureLabel()
		addContentToScrollView()
		configureRules()
	}
	
	func configureScrollView() {
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		scrollView.showsVerticalScrollIndicator = true
		scrollView.alwaysBounceVertical = true
	}
	
	func configureContentView() {
		contentView.translatesAutoresizingMaskIntoConstraints = false
	}
	
	func prepareScrollView() {
		view.addSubview(scrollView)
		scrollView.addSubview(contentView)
		
		NSLayoutConstraint.activate([
			scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
			scrollView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
			
			contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
			contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
			contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
			contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
			contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
			
		])
	}
	
	func configureLabel() {
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Terms & Conditions"
		label.textColor = .black
		label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
		
	}
	
	func configureRules() {
		rules.translatesAutoresizingMaskIntoConstraints = false
		rules.text = """
   Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.
   Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.
   """
		rules.numberOfLines = 0
		rules.sizeToFit()
		rules.textColor = UIColor(red: 124/255, green: 130/255, blue: 161/255, alpha: 1)
		rules.font = UIFont.systemFont(ofSize: 18, weight: .light)
		
	}
	
	func addContentToScrollView() {
		contentView.addSubview(label)
		
		NSLayoutConstraint.activate([
			label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
			label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
		])
		
		contentView.addSubview(rules)
		
		NSLayoutConstraint.activate([
			rules.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50),
			rules.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
			rules.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
			rules.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
		])
	}
}
