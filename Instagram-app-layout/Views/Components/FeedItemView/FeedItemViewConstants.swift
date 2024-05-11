//
//  FeedItemViewConstants.swift
//  Instagram-app-layout
//
//  Created by Steven Santeliz on 10/5/24.
//

import Foundation

extension FeedItemView: ViewConstants {
    typealias Constants = FeedItemViewConstants
    
    enum FeedItemViewConstants  {
        static let verticalSpacing: CGFloat = 10
        static let verticalPadding: CGFloat = 5
        static let horizontalSpacing: CGFloat = 12
        
        enum Header {
            static let imageName: String = "ellipsis"
            static let imageSize: CGFloat = 30
        }
        
        enum Comment {
            static let imageName: String = "plus.circle"
            static let imageSize: CGFloat = 25
        }
    }
    
    // MARK: - Buttons Options
    
    enum ButtonsOptions: CaseIterable {
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
}
