//
//  FeaturedPlaylistResponse.swift
//  SpotifyCloneUIKit
//
//  Created by Max Park on 2/28/22.
//

import Foundation

struct FeaturedPlaylistResponse: Codable {
    let playlists: PlaylistResponse
}

struct PlaylistResponse: Codable {
    let items: [Playlist]
}

struct User: Codable {
    let display_name: String
    let external_urls: [String: String]
    let id: String
}

