//
//  HomeViewConstants.swift
//  Instagram-app-layout
//
//  Created by Steven Santeliz on 10/5/24.
//

import Foundation

extension HomeView: ViewConstants {
    typealias Constants = HomeViewConstants
    
    enum HomeViewConstants {
        static let title: String = "Instagram"
        
        enum BarButtonImages {
            static let add: String = "plus.circle"
            static let notification: String = "suit.heart"
            static let message: String = "ellipsis.message"
        }
    }
}
