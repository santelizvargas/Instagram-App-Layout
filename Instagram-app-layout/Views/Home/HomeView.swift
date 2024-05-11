//
//  HomeView.swift
//  Instagram-app-layout
//
//  Created by Steven Santeliz on 10/5/24.
//

import SwiftUI

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
                    Text(Constants.title)
                        .font(.largeTitle.bold())
                }
                
                toolbarButtonRight(Constants.BarButtonImages.add)
                toolbarButtonRight(Constants.BarButtonImages.notification)
                toolbarButtonRight(Constants.BarButtonImages.message)
            }
        }
    }
    
    private func toolbarButtonRight(_ image: String) -> some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Image(systemName: image)
        }
    }
}
