//
//  PreviewProvider.swift
//  SwiftUIPractice_20250803
//
//  Created by Yen Lin on 2025/8/3.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

struct User {
    let userName: String
    let userImage: String
}

class DeveloperPreview {
    static let instance = DeveloperPreview()
    
    private init() {}
    
    lazy var vm: HomeViewModel = {
        var vm = HomeViewModel()
        vm.user = self.user
        vm.songs = self.songs
        vm.playlists = self.playLists
        vm.newMusic = self.newMusic
        return vm
    }()
    
    let user = User(userName: "Yen Lin", userImage: "Profile")
    
    let artist = "Mariah Carey"
    let song = "We Belong Together (Mimi's Late Night Valentine's Mix)"
    let albumImage = "AlbumImage"
    let deviceName = "Yen Lin's Airpods Pro"
    
    lazy var songs = [
        MusicItem(artist: self.artist, song: self.song)
    ]
    
    let playLists = [
        PlaylistItem(imageName: "Collections", title: "Collections"),
        PlaylistItem(imageName: "Collections", title: "Collections"),
        PlaylistItem(imageName: "Collections", title: "Collections"),
        PlaylistItem(imageName: "Collections", title: "Collections"),
        PlaylistItem(imageName: "Collections", title: "Collections"),
        PlaylistItem(imageName: "Collections", title: "Collections"),
        PlaylistItem(imageName: "Collections", title: "Collections"),
        PlaylistItem(imageName: "Collections", title: "Collections")
    ]
    
    lazy var newMusic = NewMusicItem(artist: self.artist, song: self.song, artistImage: "Artist", videoImage: "NewMusicVideo")
}
