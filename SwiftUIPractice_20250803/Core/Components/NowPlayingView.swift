//
//  NowPlayingView.swift
//  SwiftUIPractice_20250803
//
//  Created by Yen Lin on 2025/8/10.
//

import SwiftUI

enum PlayingPlatform {
    case headphone
}

struct NowPlayingView: View {
    
    var imageName: String
    var songName: String
    var artistName: String
    var playingPlatform: PlayingPlatform
    var bluetoothName: String
    
    let backgroundColor: Color = .greyColor1
    
    @State var isPlaying = false
    
    init(imageName: String, songName: String, artistName: String, playingPlatform: PlayingPlatform, bluetoothName: String) {
        self.imageName = imageName
        self.songName = songName
        self.artistName = artistName
        self.playingPlatform = playingPlatform
        self.bluetoothName = bluetoothName
    }
    
    var body: some View {
        VStack {
            HStack {
                songInfo
                Spacer()
                controlBtns
            }
            .padding()
            
            backgroundColor
                .overlay(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 0)
                        .fill(.white)
                        .frame(width: 10)
                }
                .clipShape(RoundedRectangle(cornerRadius: 8.0,
                                            style: .continuous))
                .frame(height: 2)
        }
        .background {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.theme.nowPlayingView)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    NowPlayingView(imageName: "heart", songName: "All I Want For Christmas Is You", artistName: "Mariah Carey", playingPlatform: .headphone, bluetoothName: "Yen Lin's Airpods Pro")
}

extension NowPlayingView {
    
    private var songInfo: some View {
        HStack(spacing: 8) {
            Image(systemName: imageName)
            
            VStack(alignment: .leading) {
                HStack(spacing: 4) {
                    HStack {
                        Text(songName)
                        Text("·")
                    }
                    .foregroundColor(.white)
                    
                    Text(artistName)
                        .foregroundColor(.white)
                }
                .font(.system(size: 14))
                
                HStack(spacing: 2) {
                    Image(systemName: "wifi")
                    Text(bluetoothName)
                        .font(.system(size: 12))
                }
                .foregroundColor(Color.theme.green)
            }
        }
    }
    
    private var controlBtns: some View {
        HStack(spacing: 16) {
            Button {
                
            } label: {
                Image(systemName: "headphones")
            }
            
            Button {
                
            } label: {
                Image(systemName: isPlaying ? "pause.fill" : "play.fill")
            }
        }
    }
}
