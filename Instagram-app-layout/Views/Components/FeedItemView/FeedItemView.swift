//
//  FeedItemView.swift
//  Instagram-app-layout
//
//  Created by Steven Santeliz on 10/5/24.
//

import SwiftUI

struct FeedItemView: View {
    private let postItem: PostValue
    
    init(_ postItem: PostValue) {
        self.postItem = postItem
    }
    
    var body: some View {
        VStack {
            headerView
            .padding(.horizontal)
            
            Image(postItem.image)
                .resizable()
                .scaledToFit()
            
            footerView
        }
    }
    
    // MARK: - Header View
    
    private var headerView: some View {
        HStack {
            Image(postItem.image)
                .resizable()
                .scaledToFill()
                .frame(width: Constants.Header.imageSize, 
                       height: Constants.Header.imageSize)
                .clipShape(Circle())
            
            Text(postItem.userName)
                .bold()
                .frame(maxWidth: .infinity,
                       alignment: .leading)
            
            Image(systemName: Constants.Header.imageName)
        }
    }
    
    // MARK: - Comment View
    
    private var commentView: some View {
        HStack {
            Image(postItem.image)
                .resizable()
                .scaledToFill()
                .frame(width: Constants.Comment.imageSize,
                       height: Constants.Comment.imageSize)
                .clipShape(Circle())
            
            TextField("Add a comment...", text: .constant(""))
            
            Image(systemName: Constants.Comment.imageName)
        }
    }
    
    // MARK: - Footer View
    
    private var footerView: some View {
        VStack(alignment: .leading, spacing: Constants.verticalSpacing) {
            HStack(spacing: Constants.horizontalSpacing) {
                ForEach(ButtonsOptions.allCases, id: \.self) { button in
                    Image(systemName: button.image)
                    
                    if button == .share {
                        Spacer()
                    }
                }
            }
            
            Text("\(postItem.likesCount) likes")
            
            HStack(spacing: Constants.verticalPadding) {
                Text(postItem.userName)
                    .bold()
                
                Text(postItem.description)
                    .italic()
            }
            
            commentView
            
            Text(postItem.timeAgo)
                .font(.caption)
                .foregroundStyle(.gray)
        }
        .padding(.vertical, Constants.verticalPadding)
        .padding(.horizontal)
    }
}
