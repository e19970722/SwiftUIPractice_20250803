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
    @StateObject var nowPlayingVM = NowPlayingViewModel()
    
    init() {
        // 移除所有 UITableView 的背景
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    var body: some Scene {
        WindowGroup {
            let nowPlayingViewHeight = UIScreen.main.bounds.height * (57 / 874)
            tabBarView
                .overlay(alignment: .bottomLeading, content: {
                    NowPlayingView()
                        .environmentObject(nowPlayingVM)
                        .frame(height: nowPlayingViewHeight)
                        .safeAreaPadding(.bottom, UITabBarController().height + 8)
                        .padding(.horizontal, 8)
                        /// 解決遮擋Tab Bar點擊事件
//                        .allowsHitTesting(false)
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

extension UITabBarController {
    var height: CGFloat {
        return self.tabBar.frame.size.height
    }
}
