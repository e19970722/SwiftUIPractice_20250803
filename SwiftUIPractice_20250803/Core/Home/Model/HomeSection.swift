//
//  HomeSection.swift
//  SwiftUIPractice_20250803
//
//  Created by Yen Lin on 2025/10/2.
//

import Foundation

enum SectionLayout {
    case three
    case four
}

struct HomeSection: Identifiable {
    var id: String = UUID().uuidString
    let name: String
    let albums: [MusicItem]
    let layout: SectionLayout
    
    init(name: String, albums: [MusicItem], layout: SectionLayout = .three) {
        self.name = name
        self.albums = albums
        self.layout = layout
    }
}
