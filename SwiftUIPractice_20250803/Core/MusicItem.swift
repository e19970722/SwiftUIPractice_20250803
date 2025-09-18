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
    let songUrl: String?
    let duration: Double?
    
    init(artist: String, song: String, album: String? = nil, songUrl: String? = nil, duration: Double? = nil) {
        self.artist = artist
        self.song = song
        self.album = album
        self.songUrl = songUrl
        self.duration = duration
    }
}
