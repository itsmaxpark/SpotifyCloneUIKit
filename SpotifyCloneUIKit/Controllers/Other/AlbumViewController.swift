//
//  AlbumViewController.swift
//  SpotifyCloneUIKit
//
//  Created by Max Park on 2/28/22.
//

import UIKit

class AlbumViewController: UIViewController {

    private let album: Album
    
    init(album: Album) {
        self.album = album
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = album.name
        view.backgroundColor = .systemBackground
    }
    
}
