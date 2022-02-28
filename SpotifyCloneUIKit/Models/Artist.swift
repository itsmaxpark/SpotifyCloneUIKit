//
//  Artist.swift
//  SpotifyCloneUIKit
//
//  Created by Max Park on 2/27/22.
//

import Foundation

struct Artist: Codable {
    let id: String
    let name: String
    let type: String
    let external_urls: [String: String]
}
