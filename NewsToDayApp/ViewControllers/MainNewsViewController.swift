//
//  MainNewsViewController.swift
//  NewsToDayApp
//
//  Created by Админ on 17.05.2023.
//

import UIKit
import ProgressHUD

enum SectionsVariable {
    case news1(model: [JustNewsModelView])
    case news2(model: [JustNewsModelView])
    case news3(model: [JustNewsModelView])
    
    var title: String {
        switch self {
        case .news1:
            return "Browse:"
        case .news2:
            return "Main News:"
        case .news3:
            return "Recomended for you:"
        }
    }
}

class MainNewsViewController: UIViewController {
    
    private var sections = [SectionsVariable]()
    
    var dataModel = [NewsResult]()
    
    let category = ["Business", "Sport", "Politics", "Health","Science", "Gaming", "Technology"]
    
    let searchController: UISearchController = {
        let vc = UISearchController(searchResultsController: SearchResultsViewController())
        vc.searchBar.placeholder = "News, talks, rumors.."
        vc.searchBar.searchBarStyle = .minimal
        vc.definesPresentationContext = true
        return vc
    }()
    
    private var collectionView: UICollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: { section, _ in
            return MainNewsViewController.createSectionLayout(section: section)
        })
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.searchController = searchController
        
        fetchData()
        configureCollectionView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
        
    }
    
    private func configureCollectionView() {
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        collectionView.backgroundColor = .systemBackground
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(MainNewsModelViewCollectionViewCell.self, forCellWithReuseIdentifier: MainNewsModelViewCollectionViewCell.identifire)
        collectionView.register(CategoryNewsViewModelCollectionViewCell.self, forCellWithReuseIdentifier: CategoryNewsViewModelCollectionViewCell.identifier)
        collectionView.register(RecomendedNewsViewCollectionViewCell.self, forCellWithReuseIdentifier: RecomendedNewsViewCollectionViewCell.identifier)
        collectionView.register(TitleHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TitleHeaderCollectionReusableView.identifire)
        
        
    }
    
    private func fetchData() {
        
        var mainNews: MainNewsModel?
        var mainRecNews: MainNewsModel?
        var topHeadLineNews: TopHeadlineNewsModel?
        
        let randomCat = category.randomElement() ?? "putin"
        
        let group = DispatchGroup()
        group.enter()
        group.enter()
        //group.enter()
        ProgressHUD.show()
        APICaller.shared.fetchNewsPopularNewsRequest(request: randomCat) { result in
            defer {
                group.leave()
            }
            switch result {
            case .failure(let error):
                print(error)
            case .success(let news):
                mainNews = news
                //print(news)
                
            }
        }
        
        APICaller.shared.fetchNewsPopularNewsRequest(request: "design") { result in
            defer {
                group.leave()
            }
            switch result {
            case .failure(let error):
                print(error)
            case .success(let news):
                mainRecNews = news
                //print(news)
                
            }
        }
        
        //        APICaller.shared.fetchNewsTopNewsRequest { result in
        //            defer {
        //                group.leave()
        //            }
        //            switch result {
        //            case .success(let model):
        //                //print(model)
        //                topHeadLineNews = model
        //            case .failure(let error):
        //                print(error.localizedDescription)
        //            }
        //        }
        
        group.notify(queue: .main) {
            guard let freshNews = mainNews?.articles,
                  let recNews = mainRecNews?.articles else {
                return
            }
            ProgressHUD.dismiss()
            self.configureModels(mainNewsResult: freshNews, mainRecNews: recNews)
        }
    }
    
    private func configureModels(mainNewsResult: [NewsResult], mainRecNews: [NewsResult]) {
        
        dataModel = mainNewsResult
        sections.append(.news1(model: mainNewsResult.compactMap({
            return JustNewsModelView(
                imageURL: URL(string: ""),
                newsCateg: $0.title,
                mainNews: "")
        })))
        
        sections.append(.news2(model: mainNewsResult.compactMap({
            return JustNewsModelView(
                imageURL: $0.urlToImage,
                newsCateg: $0.title,
                mainNews: $0.content)
            
        })))
        
        sections.append(.news3(model: mainRecNews.compactMap({
            return JustNewsModelView(
                imageURL: $0.urlToImage,
                newsCateg: $0.source.name,
                mainNews: $0.description)
        })))
        
        collectionView.reloadData()
        
    }
    
    private static func createSectionLayout(section: Int) -> NSCollectionLayoutSection {
        let supplementaryView = [
            
            NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(50)),
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top)
            
        ]
        
        switch section {
        case 0:
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.9),
                    heightDimension: .fractionalHeight(0.9 )))
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 2, trailing: 2)
            let verticalGroup = NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.5),
                    heightDimension: .absolute(50)),
                subitem: item,
                count: 1)
            
            let horizontalGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.3),
                    heightDimension: .absolute(50)),
                subitem: verticalGroup,
                count: 1)
            
            let section = NSCollectionLayoutSection(group: horizontalGroup)
            section.orthogonalScrollingBehavior = .groupPaging
            section.boundarySupplementaryItems = supplementaryView
            return section
        case 1:
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .absolute(250),
                    heightDimension: .absolute(250)))
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 20)
            
            let verticalGroup = NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .absolute(250),
                    heightDimension: .absolute(250)),
                subitem: item,
                count: 1)
            
            let horizontalGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .absolute(250),
                    heightDimension: .absolute(250)),
                subitem: verticalGroup ,
                count: 1)
            
            let section = NSCollectionLayoutSection(group: horizontalGroup)
            section.boundarySupplementaryItems = supplementaryView
            section.orthogonalScrollingBehavior = .groupPaging
            return section
        case 2:
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(100)))
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 2, trailing: 2)
            
            let group = NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(100)),
                subitem: item,
                count: 1)
            
            let section = NSCollectionLayoutSection(group: group)
            section.boundarySupplementaryItems = supplementaryView
            return section
            
        default:
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(1.0)))
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            let group = NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(120)),
                subitem: item,
                count: 1)
            
            let section = NSCollectionLayoutSection(group: group)
            section.boundarySupplementaryItems = supplementaryView
            return section
        }
    }
    
}

extension MainNewsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let type = sections[section]
        switch type {
        case .news1(let viewModels):
            return category.count
        case .news2(let viewModels):
            return viewModels.count
        case .news3(let viewModels):
            return viewModels.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: TitleHeaderCollectionReusableView.identifire, for: indexPath) as? TitleHeaderCollectionReusableView, kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }
        let headerTitle = sections[indexPath.section].title
        header.configure(with: headerTitle )
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let type = sections[indexPath.section]
        switch type {
        case .news1(model: let viewModels):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryNewsViewModelCollectionViewCell.identifier, for: indexPath) as? CategoryNewsViewModelCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            let categoryIndex = category[indexPath.row]
            cell.categoryNewsLbl.text = categoryIndex
            return cell
        case .news2(let viewModels):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainNewsModelViewCollectionViewCell.identifire, for: indexPath) as? MainNewsModelViewCollectionViewCell else {
                return UICollectionViewCell()
            }
            let indexData = viewModels[indexPath.row]
            cell.configureCells(with: indexData)
            return cell
        case .news3(model: let model):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecomendedNewsViewCollectionViewCell.identifier, for: indexPath) as? RecomendedNewsViewCollectionViewCell else {
                return UICollectionViewCell()
            }
            let indexData = model[indexPath.row]
            cell.configure(with: indexData)
            return cell
        }
    }
}

extension MainNewsViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        ////
    }
    
    
}
