//
//  AllCategoriesResponse.swift
//  SpotifyCloneUIKit
//
//  Created by Max Park on 3/3/22.
//

import Foundation

struct AllCategoriesResponse: Codable {
    let categories: Categories
}

struct Categories: Codable {
    let items: [Category]
}

struct Category: Codable {
    let id: String
    let name: String
    let icons: [APIImage]
}
