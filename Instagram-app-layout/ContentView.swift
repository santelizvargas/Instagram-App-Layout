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

struct StoryListView: View {
    private let stories: [StoryValue]
    
    init(stories: [StoryValue] = StoryValue.mockStories) {
        self.stories = stories
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(stories) { story in
                    VStack {
                        StoryView(imageName: story.imageName)
                        Text(story.name)
                    }
                }
            }
            .padding()
        }
    }
}

struct PostValue: Identifiable {
    let id: UUID = UUID()
    let userName: String
    let image: ImageResource
    let likesCount: Int
    let description: String
    let timeAgo: String
}

extension PostValue {
    static let mockPosts: [PostValue] = [
        PostValue(userName: "John", image: .avatar1, likesCount: 20, description: "Lorem ipsum.", timeAgo: "2 hours ago"),
        PostValue(userName: "Emily", image: .avatar2, likesCount: 15, description: "Praesent volutpat.", timeAgo: "1 day ago"),
        PostValue(userName: "Michael", image: .avatar3, likesCount: 30, description: "Curabitur ut felis.", timeAgo: "3 hours ago"),
        PostValue(userName: "Sophia", image: .avatar4, likesCount: 25, description: "Vivamus vel magna.", timeAgo: "1 week ago"),
        PostValue(userName: "Daniel", image: .avatar1, likesCount: 18, description: "Integer ultrices.", timeAgo: "4 hours ago"),
        PostValue(userName: "Olivia", image: .avatar2, likesCount: 22, description: "Fusce a justo.", timeAgo: "5 days ago"),
        PostValue(userName: "James", image: .avatar3, likesCount: 27, description: "Morbi tempor.", timeAgo: "6 hours ago"),
        PostValue(userName: "Emma", image: .avatar4, likesCount: 35, description: "Donec condimentum.", timeAgo: "2 weeks ago"),
        PostValue(userName: "William", image: .avatar1, likesCount: 17, description: "Phasellus maximus.", timeAgo: "3 days ago"),
        PostValue(userName: "Ava", image: .avatar2, likesCount: 23, description: "Maecenas non mauris.", timeAgo: "1 month ago")
    ]
}

struct FeedItemView: View {
    private enum ButtonsOptions: CaseIterable {
        case like, comment, share, favorite
        
        var image: String {
            switch self {
                case .like: "suit.heart"
                case .comment: "message"
                case .share: "paperplane"
                case .favorite: "bookmark"
            }
        }
    }
    
    private let postItem: PostValue
    
    init(_ postItem: PostValue = PostValue(userName: "William", image: .avatar1, likesCount: 17, description: "Phasellus maximus.", timeAgo: "1 month ago")) {
        self.postItem = postItem
    }
    
    var body: some View {
        VStack {
            HStack {
                Image(postItem.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                
                Text(postItem.userName)
                    .bold()
                    .frame(maxWidth: .infinity, 
                           alignment: .leading)
                
                Image(systemName: "ellipsis")
            }
            .padding(.horizontal)
            
            Image(postItem.image)
                .resizable()
                .scaledToFit()
            
            VStack(alignment: .leading, spacing: 10) {
                HStack(spacing: 12) {
                    ForEach(ButtonsOptions.allCases, id: \.self) { button in
                        Image(systemName: button.image)
                        
                        if button == .share {
                            Spacer()
                        }
                    }
                }
                
                Text("\(postItem.likesCount) likes")
                
                HStack(spacing: 5) {
                    Text(postItem.userName)
                        .bold()
                    
                    Text(postItem.description)
                        .italic()
                }
                
                HStack {
                    Image(postItem.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 25, height: 25)
                        .clipShape(Circle())
                    
                    TextField("Add a comment...", text: .constant(""))
                    
                    Image(systemName: "plus.circle")
                }
                
                Text(postItem.timeAgo)
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            .padding(.vertical, 5)
            .padding(.horizontal)
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

struct StoryView: View {
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
                StoryListView()
                
                LazyVStack {
                    ForEach(PostValue.mockPosts) { post in
                        FeedItemView(post)
                        
                        Divider()
                            .padding([.horizontal, .bottom])
                    }
                }
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
