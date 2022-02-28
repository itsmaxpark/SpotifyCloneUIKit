//
//  AlbumDetailsResponse.swift
//  SpotifyCloneUIKit
//
//  Created by Max Park on 2/28/22.
//

import Foundation

struct AlbumDetailsReponse: Codable {
    let album_type: String
    let artists: [Artist]
    let available_markets: [String]
    let external_url: [String: String]?
    let id: String
    let images: [APIImage]
    let label: String
    let name: String
    let tracks: TracksResponse
    
}

struct TracksResponse: Codable {
    let items: [AudioTrack]
}
