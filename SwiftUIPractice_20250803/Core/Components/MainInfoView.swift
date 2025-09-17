//
//  MainInfoView.swift
//  SwiftUIPractice_20250803
//
//  Created by Yen Lin on 2025/9/16.
//

import SwiftUI

struct MainInfoView: View {
    
    @State private var showAlertMsg: AlertItem? = nil
    var profileImageName: String
    
    var body: some View {
        GeometryReader { geo in
            HStack(alignment: .center, spacing: 8) {
                Image(profileImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geo.size.height,
                           height: geo.size.height)
                    .clipShape(Circle())
                
                Button {
                    showAlertMsg = AlertItem(id: "All",
                                             title: "Message",
                                             msg: "All")
                } label: {
                    Text("All")
                        .modifier(SegmentBtnViewModifier(isSelected: true))
                        
                }
                .alert(item: $showAlertMsg) { item in
                    Alert(title: Text(item.title),
                          message: Text(item.msg),
                          dismissButton: .default(Text("OK")))
                }
                Button {
                    
                } label: {
                    Text("Music")
                        .modifier(SegmentBtnViewModifier(isSelected: false))
                }
                
                Button {
                    
                } label: {
                    Text("Podcasts")
                        .modifier(SegmentBtnViewModifier(isSelected: false))
                }
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    MainInfoView(profileImageName: DeveloperPreview.instance.user.userImage)
        .frame(height: UIScreen.main.bounds.height * 0.05)
}
