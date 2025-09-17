//
//  NowPlayingView.swift
//  SwiftUIPractice_20250803
//
//  Created by Yen Lin on 2025/8/10.
//

import SwiftUI

enum PlayingPlatform {
    case none
    case headphone
    case computer
}

enum PlayingDevice: String {
    case none
    case bluetooth
}

struct NowPlayingView: View {
    
    var artistName: String
    var songName: String
    var albumImage: String
    var playingPlatform: PlayingPlatform
    var playingDevice: PlayingDevice
    var deviceName: String
    
    let backgroundColor: Color = .greyColor1
    
    @State var isPlaying = false
    
    init(artistName: String, songName: String, albumImage: String, playingPlatform: PlayingPlatform, playingDevice: PlayingDevice, deviceName: String, isPlaying: Bool = false) {
        self.artistName = artistName
        self.songName = songName
        self.albumImage = albumImage
        self.playingPlatform = playingPlatform
        self.playingDevice = playingDevice
        self.deviceName = deviceName
        self.isPlaying = isPlaying
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .center, spacing: 8) {
                songMainView
                progressView
                    .frame(height: geo.size.height * 0.03)
            }
        }
        .padding(.horizontal, 8)
        .padding(.top, 8)
        .background(Color.theme.nowPlayingView)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    NowPlayingView(artistName: DeveloperPreview.instance.artist,
                   songName: DeveloperPreview.instance.song,
                   albumImage: DeveloperPreview.instance.albumImage,
                   playingPlatform: .headphone,
                   playingDevice: .bluetooth,
                   deviceName: DeveloperPreview.instance.deviceName,
                   isPlaying: false)
    .frame(height: UIScreen.main.bounds.height * (70 / 874))
}

extension NowPlayingView {
    
    private var songMainView: some View {
        GeometryReader { geo in
            HStack {
                songInfoView(height: geo.size.height)
                Spacer()
                controlBtns
            }
        }
    }
    
    private var progressView: some View {
        
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 16)
                .fill(.greyColor1)
            
            RoundedRectangle(cornerRadius: 16)
                .fill(.white)
                .frame(width: 80)
        }
        
    }
    
    private func songInfoView(height: CGFloat) -> some View {
        HStack(spacing: 8) {
            Image(albumImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: height, height: height)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                
            songTitleAndDeviceView
        }
    }
    
    private var songTitleAndDeviceView: some View {
        VStack(alignment: .leading, spacing: 4) {
            songTitle
            deviceView
        }
    }
    
    private var songTitle: some View {
        HStack(spacing: 4) {
            HStack {
                Text(songName)
                    .lineLimit(1)
                Text("·")
            }
            .foregroundColor(.white)
            
            Text(artistName)
                .lineLimit(1)
                .foregroundColor(.secondaryTextColor2)
        }
        .font(.system(size: 14))
    }
    
    private var deviceView: some View {
        HStack(spacing: 2) {
            Image(self.playingDevice.rawValue)
                .resizable()
                .frame(width: 14, height: 14)
            Text(deviceName)
                .font(.system(size: 12))
        }
        .foregroundColor(Color.theme.green)
    }
    
    private var controlBtns: some View {
        HStack(spacing: 24) {
            Button {
                
            } label: {
                Image(systemName: "headphones")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(Color.theme.green)
            }
            
            Button {
                
            } label: {
                Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                    .resizable()
                    .frame(width: 18, height: 18)
                    .foregroundColor(.white)
            }
        }
        .padding(.horizontal, 8)
    }
}
