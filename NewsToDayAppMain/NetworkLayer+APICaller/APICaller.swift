//
//  APICaller.swift
//  NewsToDayApp
//
//  Created by Админ on 17.05.2023.
//

import Foundation

//https://newsapi.org/v2/everything?q=bitcoin&from=2023-05-09&apiKey=7a38df787ac74fc6acba9dca4350aa8b //

import Foundation

class APICaller {
    
    static let shared = APICaller()
    
    //MARK: - HTTP Methods & Errors
    enum HTTPMethod: String {
        case GET
        case POST
    }
    
    enum APIError: Error {
        case faileedToGEtData
    }
    //MARK: - Create Request Methods
    private func createRequest(with url: URL?,type: HTTPMethod,completion: @escaping(URLRequest) -> Void) {
        guard let urlString = url else { return }
        var request = URLRequest(url: urlString)
        request.httpMethod = type.rawValue
        request.timeoutInterval = 30
        completion(request)
    }
    //MARK: - Create Popular News Fetching Methods
    public func fetchNewsPopularNewsRequest(request query: String ,comletion: @escaping(Result<MainNewsModel,Error>) -> Void) {
        createRequest(with: URL(string: Constants.baseAPIUrl + Constants.popularPref + "q=\(query)" + Constants.apiKey) , type: .GET) { request in
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data,error == nil else {
                    comletion(.failure(APIError.faileedToGEtData))
                    return
                }
                do {
                    let result = try JSONDecoder().decode(MainNewsModel.self, from: data)
                    //JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                    comletion(.success(result))
                    //print(result)
                } catch {
                    comletion(.failure(error))
                }
            }
            task.resume()
        }
    }
    //MARK: - Create TOP News Fetching Methods
    public func fetchNewsTopNewsRequest(comletion: @escaping(Result<TopHeadlineNewsModel,Error>) -> Void) {
        createRequest(with: URL(string: Constants.baseAPIUrl + Constants.topPref + Constants.country + Constants.apiKey) , type: .GET) { request in
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data,error == nil else {
                    comletion(.failure(APIError.faileedToGEtData))
                    return
                }
                do {
                    let result = try JSONDecoder().decode(TopHeadlineNewsModel.self, from: data)
                    //JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                    comletion(.success(result))
                    print(Constants.baseAPIUrl + Constants.topPref + Constants.country + Constants.apiKey)
                    //print(result)
                } catch {
                    comletion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    //MARK: - Create Search Fetching Methods
    public func fetchSearchNews(request query: String ,comletion: @escaping(Result<MainNewsModel,Error>) -> Void) {
        createRequest(with: URL(string: Constants.baseAPIUrl + Constants.popularPref + "q=\(query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed ) ?? "")" + Constants.apiKey) , type: .GET) { request in
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data,error == nil else {
                    comletion(.failure(APIError.faileedToGEtData))
                    return
                }
                do {
                    let result = try JSONDecoder().decode(MainNewsModel.self, from: data)
                    //JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                    comletion(.success(result))
                    //print(result)
                } catch {
                    comletion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
}
