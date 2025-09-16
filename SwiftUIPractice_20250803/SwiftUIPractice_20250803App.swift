//
//  SwiftUIPractice_20250803App.swift
//  SwiftUIPractice_20250803
//
//  Created by Yen Lin on 2025/8/3.
//

import SwiftUI

@main
struct SwiftUIPractice_20250803App: App {
    
    /// ⚠️ TODO: 目前替換成測試 VM
//    @StateObject var vm = HomeViewModel()
    @StateObject var vm = DeveloperPreview.instance.vm
    
    init() {
        // 移除所有 UITableView 的背景
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    var body: some Scene {
        WindowGroup {
            tabBarView
                .overlay(alignment: .bottomLeading, content: {
                    nowPlayingView
                        .frame(height: UIScreen.main.bounds.height * (56 / 852))
                        .safeAreaPadding(.bottom, UITabBarController().height + 16)
                })
        }
    }
    
    private var tabBarView: some View {
        TabView {
            NavigationView {
                HomeView()
            }
            .environmentObject(vm)
            .tabItem {
                Label("Home", systemImage: "house")
            }
            
            NavigationView {
                Text("Search")
            }
            .tabItem {
                Label("Search", systemImage: "magnifyingglass")
            }
            
            NavigationView {
                Text("Your Library")
            }
            .tabItem {
                Label("Your Library", systemImage: "play.square.stack")
            }
            
            NavigationView {
                Text("Create")
            }
            .tabItem {
                Label("Create", systemImage: "plus")
            }
        }
        .tint(.white)
        
    }
}

extension SwiftUIPractice_20250803App {
    private var nowPlayingView: some View {
        NowPlayingView(imageName: "heart",
                       songName: "All I Want For Christmas Is You",
                       artistName: "Mariah Carey",
                       playingPlatform: .headphone,
                       bluetoothName: "Yen Lin's Airpods Pro")
            .padding(.all, 8)
    }
}

extension UITabBarController {
    var height: CGFloat {
        return self.tabBar.frame.size.height
    }
}
