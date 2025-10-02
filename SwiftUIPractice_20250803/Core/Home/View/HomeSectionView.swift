//
//  HomeSectionView.swift
//  SwiftUIPractice_20250803
//
//  Created by Yen Lin on 2025/10/2.
//

import SwiftUI

struct HomeSectionView: View {
    
    var sectionTitle: String
    var albums: [MusicItem]
    var layout: SectionLayout
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(sectionTitle)
                .font(.system(size: 36, weight: .bold))
                .foregroundColor(.white)
            
            albumsView
                .background(.white)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    HomeSectionView(sectionTitle: DeveloperPreview.instance.homeSections.first?.name ?? "",
                    albums: DeveloperPreview.instance.songs,
                    layout: .three)
        .background(.black)
        .frame(width: UIScreen.main.bounds.size.width, height: 240)
}

extension HomeSectionView {
    
    private var itemWidth: CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        let itemCount: CGFloat = layout == .three ? 3 : 4
        let spacing: CGFloat = 16
        let horizontalPadding: CGFloat = 32 // 16 * 2
        
        return (screenWidth - horizontalPadding - (spacing * (itemCount - 1))) / itemCount
    }
    
    private var albumsView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 16) {
//                ForEach(albums) { album in
//                    AlbumImageTextView(imageName: album.albumImageName,
//                                       description: album.albumName)
//                        .frame(width: itemWidth)
//                }
                
                if let firstAlbum = self.albums.first {
                    AlbumImageTextView(imageName: firstAlbum.albumImageName,
                                       description: firstAlbum.albumName)
                        .frame(width: itemWidth)
                    AlbumImageTextView(imageName: firstAlbum.albumImageName,
                                       description: firstAlbum.albumName)
                        .frame(width: itemWidth)
                    AlbumImageTextView(imageName: firstAlbum.albumImageName,
                                       description: firstAlbum.albumName)
                        .frame(width: itemWidth)
                    AlbumImageTextView(imageName: firstAlbum.albumImageName,
                                       description: firstAlbum.albumName)
                        .frame(width: itemWidth)
                    AlbumImageTextView(imageName: firstAlbum.albumImageName,
                                       description: firstAlbum.albumName)
                        .frame(width: itemWidth)
                    AlbumImageTextView(imageName: firstAlbum.albumImageName,
                                       description: firstAlbum.albumName)
                        .frame(width: itemWidth)
                }
            }
            .padding(.horizontal, 16)
        }
    }
}
