//
//  MainNewsModel.swift
//  NewsToDayApp
//
//  Created by Админ on 17.05.2023.
//

import Foundation

struct MainNewsModel: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [NewsResult]
}

struct NewsResult: Codable {
    let source: Source
    let author: String?
    let title: String
    let description: String
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String
}

struct Source: Codable {
    let id: String?
    let name: String
}
