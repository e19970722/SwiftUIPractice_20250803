//
//  NowPlayingViewModel.swift
//  SwiftUIPractice_20250803
//
//  Created by Yen Lin on 2025/9/17.
//

import Foundation
import Combine

enum PlayingPlatform {
    case none
    case headphone
    case computer
}

enum PlayingDevice: String {
    case none
    case bluetooth
}

class NowPlayingViewModel: ObservableObject {
    
    // ⚠️ TODO: 傳入真實播放值
    @Published var isPlaying: Bool = false
    @Published var currentSong: MusicItem = DeveloperPreview.instance.currentSong
    @Published var currentProgress: Double = 0.35
    @Published var playingPlatform: PlayingPlatform = .headphone
    @Published var playingDevice: PlayingDevice = .bluetooth
    @Published var deviceName = DeveloperPreview.instance.deviceName
    
}
