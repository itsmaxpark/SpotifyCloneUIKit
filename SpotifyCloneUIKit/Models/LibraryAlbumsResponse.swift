//
//  LibraryAlbumsResponse.swift
//  SpotifyCloneUIKit
//
//  Created by Max Park on 3/5/22.
//

import Foundation

struct LibraryAlbumsResponse: Codable {
    let items: [SavedAlbum]
}

struct SavedAlbum: Codable {
    let album: Album
    let added_at: String
}
