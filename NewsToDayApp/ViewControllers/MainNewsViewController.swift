//
//  MainNewsViewController.swift
//  NewsToDayApp
//
//  Created by Админ on 17.05.2023.
//

import UIKit
import ProgressHUD

//MARK: - Screen Sections Enum & TitileHeader String
enum SectionsVariable {
    case news1(model: [JustReuseNewsModelView])
    case news2(model: [JustReuseNewsModelView])
    case news3(model: [JustReuseNewsModelView])
    
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
//MARK: - Main Class
class MainNewsViewController: UIViewController {
    
    private var sections = [SectionsVariable]()
    
    var dataModel = [NewsResult]()
    
    var category = ["Covid-19","Sports","Politics","Life","Gaming","Animals","Nature","Food","Art","History"]
    
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
        
        let randomCat = category.randomElement() ?? "putin"
        fetchData(with: randomCat)
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
        
        
        collectionView.backgroundColor = .systemGroupedBackground
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(MainNewsModelViewCollectionViewCell.self, forCellWithReuseIdentifier: MainNewsModelViewCollectionViewCell.identifire)
        collectionView.register(CategoryNewsViewModelCollectionViewCell.self, forCellWithReuseIdentifier: CategoryNewsViewModelCollectionViewCell.identifier)
        collectionView.register(RecomendedNewsViewCollectionViewCell.self, forCellWithReuseIdentifier: RecomendedNewsViewCollectionViewCell.identifier)
        collectionView.register(TitleHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TitleHeaderCollectionReusableView.identifire)
    }
    //MARK: - Data Fetch Methods
    private func fetchData(with cat: String) {
        
        var mainNews: MainNewsModel?
        var mainRecNews: MainNewsModel?
        let randomCat = category.randomElement() ?? "putin"
        
        let group = DispatchGroup()
        group.enter()
        group.enter()
        //group.enter()
        
        
        ProgressHUD.show()
        APICaller.shared.fetchNewsPopularNewsRequest(request: cat) { result in
            defer {
                group.leave()
            }
            switch result {
            case .failure(let error):
                print(error)
                ProgressHUD.showFailed()
            case .success(let news):
                mainNews = news
                //print(news)
                
            }
        }
        
        APICaller.shared.fetchNewsPopularNewsRequest(request: randomCat) { result in
            defer {
                group.leave()
            }
            switch result {
            case .failure(let error):
                print(error)
                ProgressHUD.showFailed()
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
    //MARK: - Sections Model Configure Methods
    private func configureModels(mainNewsResult: [NewsResult], mainRecNews: [NewsResult]) {
        
        dataModel = mainNewsResult
        sections.append(.news1(model: mainNewsResult.compactMap({
            return JustReuseNewsModelView(
                imageURL: URL(string: $0.urlToImage ?? Constants.stockImage) ,
                newsCateg: $0.source.name,
                mainNews: $0.content,
                autor: $0.author ?? $0.publishedAt,
                nameState:$0.title,
                desc: $0.description, url: $0.url)
        })))
        
        sections.append(.news2(model: mainNewsResult.compactMap({
            return JustReuseNewsModelView(
                imageURL: URL(string: $0.urlToImage ?? Constants.stockImage),
                newsCateg: $0.source.name,
                mainNews: $0.content,
                autor: $0.author ?? $0.publishedAt,
                nameState:$0.title,
                desc: $0.description, url: $0.url)
            
        })))
        
        sections.append(.news3(model: mainRecNews.compactMap({
            return JustReuseNewsModelView(
                imageURL: URL(string: $0.urlToImage ?? Constants.stockImage),
                newsCateg: $0.source.name,
                mainNews: $0.description,
                autor: "",
                nameState: "",
                desc: $0.description, url: $0.url)
        })))
        
        
        collectionView.reloadData()
        
    }
    //MARK: - Create Layout Sections Methods
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
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 15, bottom: 2, trailing: 2)
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
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15)
            
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
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 15, bottom: 2, trailing: 15)
            
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
//MARK: - Main Extensions
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let type = sections[indexPath.section]
        
        switch type {
        case .news1(let viewModel):
            sections.removeAll()
            let categoryReguest = category[indexPath.row]
            fetchData(with: categoryReguest)
            collectionView.reloadData()
        case .news2(let viewModel):
            let model = viewModel[indexPath.row]
            let vc = ResultsViewController()
            vc.configureResultVc(with: model)
            navigationController?.pushViewController(vc, animated: true)
        case .news3(let viewModel):
            let model = viewModel[indexPath.row]
            let vc = ResultsViewController()
            vc.configureResultVc(with: model)
            navigationController?.pushViewController(vc, animated: true)
        }
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
//MARK: - Search Delegate Extensions
extension MainNewsViewController: UISearchResultsUpdating, UISearchBarDelegate, UISearchControllerDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text,
              !query.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        
        let resultController = searchController.searchResultsController as! SearchResultsViewController
        ProgressHUD.show()
        
        APICaller.shared.fetchSearchNews(request: query) { result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                    ProgressHUD.showFailed()
                case .success(let searcModel):
                    resultController.updateTableView(with: searcModel)
                    ProgressHUD.dismiss()
                    if searcModel.totalResults == 0 {
                        ProgressHUD.showFailed()
                        let alertC = UIAlertController(title: "Wrong data!", message: "Something wrong with data files! Try to refresh your request..", preferredStyle: .alert)
                        
                        let alertAction = UIAlertAction(title: "Try Again!", style: .default) {_ in
                            searchController.searchBar.text = ""
                        }
                        alertC.addAction(alertAction)
                        self.present(alertC, animated: true, completion: nil)
                    }
                }
            }
        }
    }
}
