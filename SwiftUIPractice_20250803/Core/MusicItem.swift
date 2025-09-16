//
//  MusicItem.swift
//  SwiftUIPractice_20250803
//
//  Created by Yen Lin on 2025/9/15.
//

struct MusicItem {
    let artist: String
    let song: String
    let album: String?
    
    init(artist: String, song: String, album: String? = nil) {
        self.artist = artist
        self.song = song
        self.album = album
    }
}
