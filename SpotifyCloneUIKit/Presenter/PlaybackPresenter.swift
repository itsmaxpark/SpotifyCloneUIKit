//
//  PlaybackPresenter.swift
//  SpotifyCloneUIKit
//
//  Created by Max Park on 3/3/22.
//

import Foundation
import UIKit

final class PlaybackPresenter {
    
    static func startPlayback(
        from viewController: UIViewController,
        track: AudioTrack
    ) {
        let vc = PlayerViewController()
        vc.title = track.name
        viewController.present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
        
    }
    
    static func startPlayback(
        from viewController: UIViewController,
        tracks: [AudioTrack]
    ) {
        let vc = PlayerViewController()
        viewController.present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
    }
    
}
