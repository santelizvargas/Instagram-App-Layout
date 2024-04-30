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

struct StoryList: View {
    private let stories: [StoryValue]
    
    init(stories: [StoryValue] = StoryValue.mockStories) {
        self.stories = stories
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(stories) { story in
                    VStack {
                        Story(imageName: story.imageName)
                            .padding(5)
                        Text(story.name)
                    }
                }
            }
            .padding()
        }
    }
}

struct StoryValue: Identifiable {
    let id: UUID = UUID()
    let name: String
    let imageName: ImageResource
}

extension StoryValue {
    static let mockStories: [StoryValue] = [
        StoryValue(name: "John", imageName: .avatar1),
        StoryValue(name: "Emily", imageName: .avatar2),
        StoryValue(name: "Michael", imageName: .avatar3),
        StoryValue(name: "Sophia", imageName: .avatar4),
        StoryValue(name: "Daniel", imageName: .avatar1),
        StoryValue(name: "Olivia", imageName: .avatar2),
        StoryValue(name: "James", imageName: .avatar3),
        StoryValue(name: "Emma", imageName: .avatar4),
        StoryValue(name: "William", imageName: .avatar1),
        StoryValue(name: "Ava", imageName: .avatar2)
    ]
}

struct Story: View {
    private let imageName: ImageResource
    
    init(imageName: ImageResource = .avatar1) {
        self.imageName = imageName
    }
    
    var body: some View {
        Button { } label: {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 65, height: 65)
                .clipShape(Circle())
                .overlay {
                    Circle()
                        .stroke(.white, lineWidth: 5)
                }
                .overlay {
                    Circle()
                        .stroke(
                            LinearGradient(
                                colors: [.red, .orange],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ), lineWidth: 2
                        )
                }
        }
    }
}

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                StoryList()
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
