//
//  GlobalView.swift
//  DiG-blog
//
//  Created by Dmitry Gulyagin on 16.05.2022.
//  Copyright © 2022 Globe.tools. All rights reserved.
//

import StoneGenerator

import class Foundation.DateFormatter
import struct Foundation.Date

private let siteName = "DiG blog"

private let date: String = {
    let formater = DateFormatter()
    formater.dateFormat = "yyyy"
    return formater.string(from: Date())
}()

struct GlobalView<Conntent>: View where Conntent : View {
        
    enum SitePage: String, CaseIterable {
        case home = "Где я?"
        case blog = "Блог"
        case stoneGenerator = "StoneGenerator"
        case emojiCamera = "EmojiCamera"
        case wasteFactory = "WasteFactory"
    }
    
    var currentPage: SitePage
    
    @ViewBuilder
    var content: Conntent
        
    @ViewBuilder
    var body: some View {
        VStack() {
            header
                .frame(maxWidth: 960)
                .padding(.horizontal)
            content
                .frame(maxWidth: 960, maxHeight: .infinity)
                .padding(.horizontal)
            footer
                .foregroundColor(.labelTextThird)
        }
        .padding(.top)
    }
    
    @ViewBuilder
    var header: some View {
        VStack {
            HStack {
                Text("DiG")
                    .font(.title.withWeight(.black))
                    .padding(.horizontal, 8)
                    .background(.labelTextSecond)
                    .cornerRadius(8)
                    .foregroundColor(.white)
                Spacer()
                headerButton(.home).onTapGesture(present: HomePage())
                headerButton(.blog).onTapGesture(present: BlogPage())
                headerButton(.stoneGenerator).onTapGesture(present: StoneGeneratorPage())
                headerButton(.wasteFactory).onTapGesture(present: WasteFactoryPage())
                headerButton(.emojiCamera).onTapGesture(present: EmojiCameraPage())
            }
            Color.labelTextFourth
                .frame(height: 1)
        }
        .foregroundColor(.blue)
//        .frame(maxWidth: .infinity)
//        .background(Color.blue.opacity(0.7))
        
    }
    
    @ViewBuilder
    private func headerButton(_ page: SitePage) -> some View {
        let isSelected = (page == currentPage)
        let font = Font.title3.withWeight(.light)
        if !isSelected {
            Button(page.rawValue)
                .font(font)
        } else {
            Button(page.rawValue)
                .font(font)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(.blue)
                .cornerRadius(8)
                .foregroundColor(.white)
        }
    }
    
    @ViewBuilder
    var footer: some View {
        VStack(spacing: 0) {
            Color.labelTextFourth
                .frame(height: 1)
                .frame(maxWidth: .infinity)
            HStack {
                footerText("© \(date) \(siteName). All rights reserved.")
                Spacer()
                footerText("created by Dmitry Gulyagin for fun")
            }
            .padding()
        }
    }
    
    @ViewBuilder
    private func footerText(_ text: String) -> some View {
        Text(text)
            .fontWeight(.ultraLight)
            .font(.caption2)
    }
    
}

