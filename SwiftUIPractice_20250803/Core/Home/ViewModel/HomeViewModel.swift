//
//  HomeViewModel.swift
//  SwiftUIPractice_20250803
//
//  Created by Yen Lin on 2025/8/3.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var profileImageName: String = "person.circle"
    @Published var playlists: [PlaylistItem] = []
    @Published var newMusic: NewMusicItem = NewMusicItem(artist: "Mariah Carey",
                                                         songName: "All I Want For Christmas Is You",
                                                         imageUrl: "",
                                                         videoUrl: "")
    
    init() {
        
    }
}
