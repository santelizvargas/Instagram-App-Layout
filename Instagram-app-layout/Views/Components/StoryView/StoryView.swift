//
//  StoryView.swift
//  Instagram-app-layout
//
//  Created by Steven Santeliz on 10/5/24.
//

import SwiftUI

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
                .frame(width: Constants.imageSize, height: Constants.imageSize)
                .clipShape(Circle())
                .overlay {
                    Circle()
                        .stroke(.white, lineWidth: Constants.circlePadding)
                }
                .overlay { strokeGradientView }
        }
    }
    
    private var strokeGradientView: some View {
        Circle()
            .stroke(
                LinearGradient(
                    colors: Constants.gradientColors,
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ), lineWidth: Constants.lineWidth
            )
    }
}
