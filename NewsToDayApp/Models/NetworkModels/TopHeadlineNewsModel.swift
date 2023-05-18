//
//  TopHeadlineNewsModel.swift
//  NewsToDayApp
//
//  Created by Админ on 17.05.2023.
//

import Foundation

import Foundation

struct TopHeadlineNewsModel: Codable {
    let status: String
    let sources: [TopHeadLineNews]
}

struct TopHeadLineNews: Codable {
    let id: String
    let name: String
    let description: String
    let url: URL?
    let urlToImage: URL?
    let category: String
    let language: String
    let country: String
}
