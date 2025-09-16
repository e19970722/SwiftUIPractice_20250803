//
//  HomeView.swift
//  SwiftUIPractice_20250803
//
//  Created by Yen Lin on 2025/8/3.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading, spacing: 16) {
                MainInfoView(profileImageName: vm.user?.userImage ?? "Profile")
                    .frame(height: geo.size.height * 0.05)
                mainListView
            }
            .padding(.leading, 16)
            .padding(.trailing, 16)
            .background(Color.theme.background)
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(DeveloperPreview.instance.vm)
    
}

extension HomeView {
    
    private var mainListView: some View {
        let bottomPadding = 24.0
        return List {
            Section {
                if let playlist = vm.playlists {
                    PlaylistCollectionSectionView(playlists: playlist)
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets())
                }
            }
            .listRowBackground(Color.clear)
            .padding(.bottom, bottomPadding)
            
            Section {
                if let newMusic = vm.newMusic {
                    NewMusicView(artistImage: newMusic.artistImage ?? "",
                                 newMusic: newMusic,
                                 videoImage: newMusic.videoImage ?? "")
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets())
                }
                
            }
            .listRowBackground(Color.clear)
            .padding(.bottom, bottomPadding)

        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
    }
}
