//
//  NewMusicItem.swift
//  SwiftUIPractice_20250803
//
//  Created by Yen Lin on 2025/8/3.
//

import Foundation

struct NewMusicItem: Codable {
    let artist: String
    let songName: String
    let imageUrl: String?
    let videoUrl: String?
}
