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

class DeveloperPreview {
    static let instance = DeveloperPreview()
    
    private init() {}
    
    var vm = HomeViewModel()
    
    let songs = [
        MusicItem(artist: "Mariah Carey", song: "All I Want For Christmas Is You")
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
}
