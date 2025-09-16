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
        let screenWidth = UIScreen.main.bounds.width
        HStack(alignment: .center, spacing: 8) {
            Image(profileImageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: screenWidth * (33 / 402),
                       height: screenWidth * (33 / 402))
                .clipped()
                .cornerRadius(screenWidth * (33 / 402) / 2)
            
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

#Preview {
    MainInfoView(profileImageName: DeveloperPreview.instance.user.userImage)
}
