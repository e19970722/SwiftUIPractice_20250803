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
    
    let playLists = [
        PlaylistItem(imageName: "heart.fill", title: "Liked Songs"),
        PlaylistItem(imageName: "heart.fill", title: "Liked Songs"),
        PlaylistItem(imageName: "heart.fill", title: "Liked Songs"),
        PlaylistItem(imageName: "heart.fill", title: "Liked Songs"),
        PlaylistItem(imageName: "heart.fill", title: "Liked Songs"),
        PlaylistItem(imageName: "heart.fill", title: "Liked Songs"),
        PlaylistItem(imageName: "heart.fill", title: "Liked Songs"),
        PlaylistItem(imageName: "heart.fill", title: "Liked Songs")
    ]
}
