//
//  AppModules.swift
//  Instagram-app-layout
//
//  Created by Steven Santeliz on 10/5/24.
//

import SwiftUI

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
