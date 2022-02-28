//
//  PlaylistDetailsResponse.swift
//  SpotifyCloneUIKit
//
//  Created by Max Park on 2/28/22.
//

import Foundation

struct PlaylistDetailsResponse: Codable {
    let description: String
    let external_urls: [String: String]
    let id: String
    let name: String
    let images: [APIImage]
    let tracks: PlaylistTracksResponse
}

struct PlaylistTracksResponse: Codable {
    let items: [PlaylistItem]
}

struct PlaylistItem: Codable {
    let track: AudioTrack
}
