//
//  NowPlayingViewModel.swift
//  SwiftUIPractice_20250803
//
//  Created by Yen Lin on 2025/9/17.
//

import Foundation
import AVFoundation
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
    
    private var player: AVPlayer?
    private var playingTimer: Timer?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addObserver()
    }
    
    private func addObserver() {
        self.$isPlaying
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isPlaying in
                guard let self = self else { return }
                if isPlaying {
                    self.play()
                } else {
                    self.pause()
                }
            }
            .store(in: &cancellables)
    }
    
    func playSong(song: MusicItem) {
        if let songURLString = self.currentSong.songUrl,
           let musicURL = URL(string: songURLString) {
            player = AVPlayer(url: musicURL)
            self.isPlaying = false
            play()
        }
        
        guard let duration = self.currentSong.duration else { return }
        playingTimer = Timer.scheduledTimer(withTimeInterval: duration, repeats: false) { [weak self] _ in
            self?.isPlaying = false
            self?.pause()
        }
    }
    
    func play() {
        player?.play()
    }
    
    func pause() {
        player?.pause()
    }
}
