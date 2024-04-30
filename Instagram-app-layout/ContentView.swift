//
//  ContentView.swift
//  Instagram-app-layout
//
//  Created by Steven Santeliz on 29/4/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabBarView()
    }
}

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Instagram")
                        .font(.largeTitle.bold())
                }
                
                toolbarButtonRight("plus.circle")
                toolbarButtonRight("suit.heart")
                toolbarButtonRight("ellipsis.message")
            }
        }
    }
    
    private func toolbarButtonRight(_ image: String) -> some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Image(systemName: image)
        }
    }
}

enum AppModules: CaseIterable, Identifiable {
    case home, search, reels, markplace, profile
    
    var id: String { String(describing: self) }
    
    var imageName: String {
        switch self {
            case .home: "house"
            case .search: "magnifyingglass"
            case .reels: "play.rectangle.on.rectangle"
            case .markplace: "storefront"
            case .profile: "person.crop.circle"
        }
    }
    
    var assosiatedView: AnyView {
        switch self {
            case .home: AnyView(HomeView())
            default: AnyView(Text(id))
        }
    }
}

struct TabBarView: View {
    var body: some View {
        TabView {
            ForEach(AppModules.allCases) { item in
                item.assosiatedView
                    .tabItem {
                        Image(systemName: item.imageName)
                    }
            }
        }
        .tint(.pink)
    }
}

#Preview {
    ContentView()
}
