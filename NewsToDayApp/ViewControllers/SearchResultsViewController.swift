//
//  SearchResultsViewController.swift
//  NewsToDayApp
//
//  Created by Админ on 17.05.2023.
//

import Foundation
import UIKit
import ProgressHUD

class SearchResultsViewController: UIViewController {
    
    var searchBarResult: [MainNewsModel] = []
    var bucket = [JustReuseNewsModelView]()
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(SearchResultDefaultTableViewCell.self, forCellReuseIdentifier: SearchResultDefaultTableViewCell.identifire)
        tableView.isHidden = true
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBlurView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private  func setBlurView() {
        let blurView = UIVisualEffectView()
        blurView.frame = view.bounds
        blurView.effect = UIBlurEffect(style: .light)
        view.addSubview(blurView)
        blurView.contentView.addSubview(tableView)
    }
    
    public func updateTableView(with result: MainNewsModel) {
        searchBarResult = [result]
        
        tableView.isHidden = searchBarResult.isEmpty
        tableView.reloadData()
        
        guard let unwrap = searchBarResult.first?.articles else {return}
        bucket.append(contentsOf: unwrap.compactMap({
            return JustReuseNewsModelView(
                imageURL: URL(string: $0.urlToImage ?? Constants.stockImage) ,
                newsCateg: $0.source.name,
                mainNews: $0.content,
                autor: $0.author ?? $0.publishedAt,
                nameState:$0.title,
                desc: $0.description,
                url: $0.url
            )
        }))
    }
}

extension SearchResultsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bucket.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultDefaultTableViewCell.identifire, for: indexPath) as? SearchResultDefaultTableViewCell else {
            return UITableViewCell()
        }
        let result = bucket[indexPath.row]
        cell.configure(result)
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let model = bucket[indexPath.row]
        let vc = ResultsViewController()
        vc.configureResultVc(with: model)
        present(vc, animated: true)
    }
}
