//
//  PlaylistCollectionView.swift
//  SwiftUIPractice_20250803
//
//  Created by Yen Lin on 2025/8/3.
//

import SwiftUI

struct PlaylistCollectionView: View {
    
    let imageName: String
    let title: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Image(systemName: imageName)
                .padding(.all, 16)
                .scaledToFill()
                .background(.black)
                .cornerRadius(4)
                            
            Text(title)
                .font(.system(size: 14,
                              weight: .semibold,))
                .padding(.horizontal, 8)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .foregroundColor(.white)
        // 如果單純設定cornerRadius無效，額外給他個框框
        .background {
            RoundedRectangle(cornerRadius: 4)
                .fill(Color.theme.secondaryBtn)
        }
        .frame(maxWidth: .infinity,
               maxHeight: .infinity,
               alignment: .leading)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    PlaylistCollectionView(imageName: DeveloperPreview.instance.playLists.first!.imageName,
                           title: DeveloperPreview.instance.playLists.first!.title)
}
