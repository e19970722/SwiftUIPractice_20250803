//
//  SwiftUIPractice_20250803App.swift
//  SwiftUIPractice_20250803
//
//  Created by Yen Lin on 2025/8/3.
//

import SwiftUI

@main
struct SwiftUIPractice_20250803App: App {
    
    @StateObject var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            tabBarView
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
