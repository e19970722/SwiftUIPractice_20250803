//
//  NewMusicView.swift
//  SwiftUIPractice_20250803
//
//  Created by Yen Lin on 2025/9/16.
//

import SwiftUI

struct NewMusicView: View {
    
    var artistImage: String
    var newMusic: NewMusicItem
    var videoImage: String
    
    var body: some View {
        GeometryReader { geo in
            let newMusicInfoHeight = geo.size.width * (9 / 16) * 0.2
            /// 保持影片16:9
            let newMusicVideoHeight = geo.size.width * (9 / 16)
            
            VStack(alignment: .leading, spacing: 16) {
                newMusicInfoView
                    .frame(height: newMusicInfoHeight)
                
                NewVideoView(videoImage: videoImage)
                    .frame(height: newMusicVideoHeight)
            }
        }
    }
}

extension NewMusicView {
    
    private var newMusicInfoView: some View {
        GeometryReader { geo in
            HStack {
                let newMusicInfoHeight = geo.size.height
                Image(artistImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: newMusicInfoHeight,
                           height: newMusicInfoHeight)
                    .clipped()
                    .cornerRadius(newMusicInfoHeight / 2)
                    .frame(width: newMusicInfoHeight,
                           height: newMusicInfoHeight)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("New Music Video From \(newMusic.artist)")
                        .foregroundColor(.gray)
                        .font(.system(size: 12, weight: .semibold))
                    Text("\(newMusic.song)")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                }
            }
        }
    }
    
}

#Preview(traits: .sizeThatFitsLayout) {
    NewMusicView(artistImage: DeveloperPreview.instance.newMusic.artistImage ?? "",
                 newMusic: DeveloperPreview.instance.newMusic,
                 videoImage: DeveloperPreview.instance.newMusic.videoImage ?? "")
    .frame(height: UIScreen.main.bounds.height * 0.5)
}
