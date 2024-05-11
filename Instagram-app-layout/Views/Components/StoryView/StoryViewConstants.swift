//
//  StoryViewConstants.swift
//  Instagram-app-layout
//
//  Created by Steven Santeliz on 10/5/24.
//

import SwiftUI

extension StoryView: ViewConstants {
    typealias Constants = StoryViewConstants
    
    enum StoryViewConstants {
        static let imageSize: CGFloat = 65
        static let circlePadding: CGFloat = 5
        static let lineWidth: CGFloat = 2
        static let gradientColors: [Color] = [.red, .orange]
    }
}
