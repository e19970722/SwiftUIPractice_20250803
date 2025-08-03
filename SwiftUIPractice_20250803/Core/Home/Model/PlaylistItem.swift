//
//  PlaylistItem.swift
//  SwiftUIPractice_20250803
//
//  Created by Yen Lin on 2025/8/3.
//

import Foundation

struct PlaylistItem: Identifiable, Codable {
    var id = UUID().uuidString
    let imageName: String
    let title: String
}
