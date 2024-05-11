//
//  StoryListView.swift
//  Instagram-app-layout
//
//  Created by Steven Santeliz on 10/5/24.
//

import SwiftUI

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
