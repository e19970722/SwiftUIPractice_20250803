//
//  HomeView.swift
//  SwiftUIPractice_20250803
//
//  Created by Yen Lin on 2025/8/3.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showAlertMsg: AlertItem? = nil
    
    private let MessageTitle = "Message"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            mainInfoView
            playlistCollectionView
            newMusicView
        }
        .padding(.leading, 16)
        .padding(.trailing, 16)
        .frame(maxWidth: .infinity,
               maxHeight: .infinity,
               alignment: .topLeading)
        .background(Color.theme.background)
    }
}

#Preview {
    HomeView()
        .environmentObject(DeveloperPreview.instance.vm)
    
}

extension HomeView {
    
    private var mainInfoView: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(systemName: vm.profileImageName)
                .foregroundColor(.white)
                .padding(.all, 8)
            
            Button {
                showAlertMsg = AlertItem(id: "All",
                                         title: MessageTitle,
                                         msg: "All")
            } label: {
                Text("All")
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .font(.system(size: 12))
                    .foregroundColor(Color.theme.secondaryText)
                    .background(.green)
                    .cornerRadius(16)
            }
            .alert(item: $showAlertMsg) { item in
                Alert(title: Text(item.title),
                      message: Text(item.msg),
                      dismissButton: .default(Text("OK")))
            }
            Button {
                
            } label: {
                Text("Music")
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .font(.system(size: 12))
                    .foregroundColor(.white)
                    .background(Color.theme.secondaryBtn)
                    .cornerRadius(16)
            }
            
            Button {
                
            } label: {
                Text("Podcast")
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .font(.system(size: 12))
                    .foregroundColor(.white)
                    .background(Color.theme.secondaryBtn)
                    .cornerRadius(16)
            }
            
        }
    }
    
    private var playlistCollectionView: some View {
        let twoColums: [GridItem] = [
            // spacing 控制左右
            GridItem(.flexible(), spacing: 8),
            GridItem(.flexible(), spacing: 0)
        ]
        return ScrollView {
            // spacing 控制上下
            LazyVGrid(columns: twoColums, spacing: 4) {
                ForEach(DeveloperPreview.instance.playLists) { playlist in
                    PlaylistCollectionView(imageName: playlist.imageName,
                                           title: playlist.title)                    
                    .frame(maxWidth: .infinity,
                           minHeight: 56,
                           alignment: .leading)
                }
            }
        }
        .fixedSize(horizontal: false, vertical: true)
    }
    
    private var newMusicView: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "person.circle")
                    .foregroundColor(.white)
                    .padding(.all, 8)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("New Music Video From \(vm.newMusic.artist)")
                        .foregroundColor(.gray)
                        .font(.system(size: 12, weight: .semibold))
                    Text("\(vm.newMusic.songName)")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                }
            }
            NewVideoView()
                .frame(height: 240)
            
        }
    }
}
