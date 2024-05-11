//
//  TabBarView.swift
//  Instagram-app-layout
//
//  Created by Steven Santeliz on 10/5/24.
//

import SwiftUI

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
