//
//  BlogPage.swift
//  DiG-blog
//
//  Created by Dmitry Gulyagin on 17.05.2022.
//  Copyright © 2022 Globe.tools. All rights reserved.
//

import StoneGenerator

public struct BlogPage: Page {
    
    public let uri: URI = .path("blog") // my NIO server capability
    
    public var body: some View {
        GlobalView(currentPage: .blog) {
            VStack {
                // TODO: - FIXIT: Refactor text render engine
                Text("😓")
                    .font(.body.withSize(60))
                    .lineSpacing(60) // Set line height for Chrome
                Text("Тут еще ничего нет")
                    .font(.largeTitle)
                    .foregroundColor(.labelTextThird)
            }
        }
    }
    
}

