//
//  StoryValue.swift
//  Instagram-app-layout
//
//  Created by Steven Santeliz on 10/5/24.
//

import UIKit

struct StoryValue: Identifiable {
    let id: UUID = UUID()
    let name: String
    let imageName: ImageResource
}

// MARK: - Mock data

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
