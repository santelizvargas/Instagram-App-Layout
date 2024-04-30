//
//  ContentView.swift
//  Instagram-app-layout
//
//  Created by Steven Santeliz on 29/4/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        NavigationView {
            TabBarView()
//        }
    }
}

//struct NavigationBarView: View {
//    
//    var body: some View {
//        HStack {
//            
//        }
//    }
//}

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
}

struct TabBarView: View {
    var body: some View {
        TabView {
            ForEach(AppModules.allCases) { item in
                Text(item.id)
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
