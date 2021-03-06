//
//  SearchResult.swift
//  SpotifyCloneUIKit
//
//  Created by Max Park on 3/3/22.
//

import Foundation

enum SearchResult {
    case artist(model: Artist)
    case album(model: Album)
    case track(model: AudioTrack)
    case playlist(model: Playlist)
}
