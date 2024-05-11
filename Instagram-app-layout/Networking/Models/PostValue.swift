//
//  PostValue.swift
//  Instagram-app-layout
//
//  Created by Steven Santeliz on 10/5/24.
//

import UIKit

struct PostValue: Identifiable {
    let id: UUID = UUID()
    let userName: String
    let image: ImageResource
    let likesCount: Int
    let description: String
    let timeAgo: String
}

// MARK: - Mock data

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

