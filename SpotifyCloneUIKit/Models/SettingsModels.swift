//
//  SettingsModels.swift
//  SpotifyCloneUIKit
//
//  Created by Max Park on 2/27/22.
//

import Foundation

struct Section {
    let title: String
    let options: [Option]
}

struct Option {
    let title: String
    let handler: () -> Void
}
