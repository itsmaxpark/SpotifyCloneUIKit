//
//  LibraryPlaylistsViewController.swift
//  SpotifyCloneUIKit
//
//  Created by Max Park on 3/4/22.
//

import UIKit

class LibraryPlaylistsViewController: UIViewController {
    
    var playlists = [Playlist]()
    
    private let noPlaylistsView = ActionLabelView()
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(SearchResultSubtitleTableViewCell.self, forCellReuseIdentifier: SearchResultSubtitleTableViewCell.identifier)
        tableView.isHidden = true
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        
        setUpNoPlaylistsView()
        
        fetchPlaylist()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        noPlaylistsView.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        noPlaylistsView.center = view.center
        tableView.frame = view.bounds
    }
    
    private func updateUI() {
        if playlists.isEmpty {
            // Show Label
            noPlaylistsView.isHidden = false
            tableView.isHidden = true
        } else {
            // Show Table
            print("playlists is not empty")
            tableView.reloadData()
            tableView.isHidden = false
            noPlaylistsView.isHidden = true
        }
    }
    
    private func setUpNoPlaylistsView() {
        view.addSubview(noPlaylistsView)
        noPlaylistsView.delegate = self
        noPlaylistsView.configure(with: ActionLabelViewViewModel(
            text: "You don't have any playlists yet",
            actionTitle: "Create")
        )
    }
    
    private func fetchPlaylist() {
        APICaller.shared.getCurrentUserPlaylists { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let playlists):
                    self?.playlists = playlists
                    self?.updateUI()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    public func showCreatePlaylistAlert() {
        let alert = UIAlertController(
            title: "New Playlist",
            message: "Enter Playlist Name",
            preferredStyle: .alert
        )
        alert.addTextField { textField in
            textField.placeholder = "New Playlist"
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Create", style: .default) { _ in
            guard let field = alert.textFields?.first,
                let text = field.text,
                !text.trimmingCharacters(in: .whitespaces).isEmpty else {
                    return
                }
            
            APICaller.shared.createPlaylists(with: text) { [weak self] success in
                if success {
                    // Refresh list of playlists
                    self?.fetchPlaylist()   
                } else {
                    print("failed to create playlist")
                }
            }
        })
        
        present(alert, animated: true)
    }
}

extension LibraryPlaylistsViewController: ActionlabelViewDelegate {
    func actionLabelViewDidTapButton(_ actionView: ActionLabelView) {
        // Show creation UI
        showCreatePlaylistAlert()
    }
}

extension LibraryPlaylistsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SearchResultSubtitleTableViewCell.identifier,
            for: indexPath
        ) as? SearchResultSubtitleTableViewCell else {
            return UITableViewCell()
        }
        let playlist = playlists[indexPath.row]
        cell.configure(
            with: SearchResultSubtitleTableViewCellViewModel(
                title: playlist.name,
                subtitle: playlist.owner.display_name,
                imageURL: URL(string: playlist.images.first?.url ?? ""))
        )
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
