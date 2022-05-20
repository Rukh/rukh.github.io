//
//  StoneTestView.swift
//  DiG-blog
//
//  Created by Dmitry Gulyagin on 18.05.2022.
//  Copyright © 2022 Globe.tools. All rights reserved.
//

import StoneGenerator

struct StoneTestView: View {
    
    var body: some View {
        let width: Float = 250
        colorTest
            .testView(width: width, height: 400, name: "colorTest")
        fontTest
            .testView(width: width, height: 400, name: "fontTest")
        paddingTest
            .testView(width: width, height: 300, name: "paddingTest")
        flexFrameTest
            .testView(width: width, height: 200, name: "flexFrameTest")
        stackTest
            .testView(width: width, height: 300, name: "stackTest")
        imageTest
            .testView(width: width, height: 300, name: "imageTest")
        backgroundTest
            .testView(width: width, height: 200, name: "backgroundTest")
    }
    
    @ViewBuilder
    var fontTest: some View {
        VStack(spacing: 10) {
            Group {
                Text("largeTitle").font(.largeTitle)
                Text("title").font(.title)
                Text("title2").font(.title2)
                Text("title3").font(.title3)
                Text("headline").font(.headline)
                Text("subheadline").font(.subheadline)
            }
            Group {
                Text("body").font(.body)
                Text("callout").font(.callout)
                Text("footnote").font(.footnote)
                Text("caption").font(.caption)
                Text("caption2").font(.caption2)
            }
        }
    }
    
    @ViewBuilder
    var colorTest: some View {
        VStack(spacing: 10) {
            HStack(spacing: 10) {
                Color.red
                Color.orange
                Color.yellow
            }
            HStack(spacing: 10) {
                Color.green
                Color.mint
                Color.teal
            }
            HStack(spacing: 10) {
                Color.cyan
                Color.blue
                Color.indigo
            }
            HStack(spacing: 10) {
                Color.purple
                Color.pink
                Color.brown
            }
            HStack(spacing: 10) {
                Color.white
                Color.gray
                Color.black
            }
        }
    }
    
    @ViewBuilder
    var paddingTest: some View {
        Text("Background & padding test")
            .foregroundColor(.white)
            .padding(10)
            .background(Color.black)
            .padding(10)
            .background(Color.white)
            .padding(10)
            .background(Color.black)
            .padding(10)
            .background(Color.white)
            .padding(10)
            .background(Color.black)
    }
    
    @ViewBuilder
    var flexFrameTest: some View {
        VStack(spacing: 10) {
            Text("Text ignore alignment")
                .frame(alignment: .leading)
            Text("Frame leading")
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("Frame trailing")
                .frame(maxWidth: .infinity, alignment: .trailing)
            Text("Frame bottom")
                .frame(maxWidth: .infinity, alignment: .bottom)
        }
    }
    
    @ViewBuilder
    var stackTest: some View {
        VStack(spacing: 10) {
            VStack(spacing: 10) {
                Text("1")
                Text("2")
                Text("3")
            }
            HStack(spacing: 10) {}
                .background(Color.red)
            HStack(spacing: 10) {
                Text("Single")
            }
            HStack(spacing: 10) {
                Text("Left")
                Text("Right")
            }
            HStack(spacing: 10) {
                Text("Extrime left")
                Spacer()
                Text("Extrime right")
            }
            Text("Colored")
                .background(.black)
                .foregroundColor(.white)
            ZStack {
                Text("ZStack")
                Text("______")
            }
        }
    }
    
    @ViewBuilder
    var imageTest: some View {
        VStack(spacing: 10) {
            Image("lena")
                .frame(width: 50, height: 50)
                .border(.green)
            HStack(spacing: 10) {
                Image("lena")
                    .frame(width: 50, height: 50)
                    .clipped()
                    .border(.red)
                Image("lena")
                    .resizable()
                    .frame(height: 50)
                    .border(.blue)
            }
            Image("lena")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 50)
                .border(.black)
            Image("lena")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 50)
                .clipped()
                .border(.pink)
        }
        .clipped()
    }
    
    @ViewBuilder
    var backgroundTest: some View {
        VStack(spacing: 10) {
            Color.teal.opacity(0.5)
                .frame(width: 40, height: 40)
                .background { Text("BACKGROUND") }
            Color.orange.opacity(0.5)
                .frame(width: 40, height: 40)
                .background {
                    Text("BACKGROUND")
                        .frame(width: 200)
                }
            Text(" + ")
                .foregroundColor(.white)
                .background { Color.blue }
                .background {
                    Text("BACKGROUND")
                        .frame(width: 200)
                }
            Text("----------")
                .background { Color.indigo }
        }
    }
    
}

extension View {
    
    @ViewBuilder
    func testView(width: Float, height: Float, name: String) -> some View {
        VStack {
            Text(name.prefix(1).capitalized + name.dropFirst(1))
                .font(.title2)
                .fontWeight(.thin)
            HStack {
                self.frame(width: width, height: height)
                Color(white: 0.3)
                    .frame(width: 1)
                Image(name)
                    .resizable()
                    .frame(width: width, height: height)
            }
        }
        .padding()
        .cornerRadius(8)
        .border(.default)
        .padding(.vertical)
    }
    
}
