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
            .testView(width: width, height: 300, name: "fontTest")
        paddingTest
            .testView(width: width, height: 250, name: "paddingTest")
        flexFrameTest
            .testView(width: width, height: 200, name: "flexFrameTest")
        stackTest
            .testView(width: width, height: 250, name: "stackTest")
        imageTest
            .testView(width: width, height: 300, name: "imageTest")
        backgroundTest
            .testView(width: width, height: 200, name: "backgroundTest")
        textTest
            .testView(width: width, height: 250, name: "textTest")
        gradientTest
            .testView(width: width, height: 250, name: "gradientTest")
    }
    
    @ViewBuilder
    var fontTest: some View {
        VStack {
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
        VStack {
            HStack {
                Color.red
                Color.orange
                Color.yellow
            }
            HStack {
                Color.green
                Color.mint
                Color.teal
            }
            HStack {
                Color.cyan
                Color.blue
                Color.indigo
            }
            HStack {
                Color.purple
                Color.pink
                Color.brown
            }
            HStack {
                Color.white
                Color.gray
                Color.black
            }
        }
    }
    
    @ViewBuilder
    var paddingTest: some View {
        Text("Padding test")
            .font(.caption)
            .foregroundColor(.white)
            .padding()
            .background(Color.black)
            .padding()
            .background(Color.white)
            .padding()
            .background(Color.black)
            .padding()
            .background(Color.white)
            .padding()
            .background(Color.black)
    }
    
    @ViewBuilder
    var flexFrameTest: some View {
        let color = Color.blue.opacity(0.5)
        HStack(alignment: .bottom) {
            VStack {
                color
                    .frame(width: 20, height: 20)
                    .frame(width: 100, height: 30)
                    .background(color)
                color
                    .frame(width: 20, height: 20)
                    .frame(
                        width: 100,
                        alignment: .trailing
                    )
                    .background(color)
                color
                    .frame(width: 20)
                    .frame(width: 100, height: 40)
                    .background(color)
                color
                    .frame(width: 30, height: 10)
                    .frame(width: 10, height: 30)
                    .background(color)
            }
            color
                .frame(width: 20)
            color
                .frame(width: 20, height: 20)
                .frame(
                    width: 50, height: 50,
                    alignment: .bottomLeading
                )
                .background(color.opacity(0.5))
                .frame(
                    width: 80, height: 80,
                    alignment: .top
                )
                .background(color)
        }
        .padding()
    }
    
    @ViewBuilder
    var stackTest: some View {
        VStack {
            VStack {
                Text("1")
                Text("2")
                Text("3")
            }
            HStack {}
                .background(Color.red)
            HStack {
                Text("Single")
            }
            HStack {
                Text("Left").background(Color.black)
                Text("Right").background(Color.black)
            }
            .foregroundColor(.white)
            HStack {
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
        HStack {
            VStack {
                Image("lena")
                    .frame(width: 50, height: 50)
                    .border(.green)
                HStack {
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
            VStack {
                Image("lena")
                    .resizable()
                    .frame(width: 50, height: 100)
                    .border(.yellow)
                Image("lena")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 100)
                    .border(.teal)
            }
            
        }
        .clipped()
    }
    
    @ViewBuilder
    var backgroundTest: some View {
        VStack {
            HStack {
                Color.teal.opacity(0.5)
                    .frame(width: 34, height: 40)
                    .overlay {
                        Text("BACKGROUND").background {
                            Color.blue.opacity(0.5)
                        }
                    }
                Color.teal.opacity(0.5)
                    .frame(width: 69, height: 40)
                    .overlay {
                        Text("BACKGROUND").background {
                            Color.blue.opacity(0.5)
                        }
                    }
            }
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
                    Color.green.opacity(0.5)
                    Text("BACKGROUND")
                        .frame(width: 200)
                }
            Text("----------")
                .background { Color.indigo }
        }
    }
    
    @ViewBuilder
    var textTest: some View {
        VStack {
            HStack {
                Text("body")
                Text("body heavy")
                    .fontWeight(.heavy)
            }
            Text("first line\nlong second line")
                .lineSpacing(10)
                .background(Color.teal.opacity(0.5))
            Text("center\nmultiline text alignment")
                .multilineTextAlignment(.center)
                .background(Color.orange.opacity(0.5))
            Text("tracking line")
                .tracking(10)
            HStack {
                VStack {
                    Text("non colapse")
                    Color.red.opacity(0.5)
                        .frame(width: 40, height: 16)
                    Text("non colapse")
                }
                .background(Color.red.opacity(0.5))
                VStack {
                    Text("colapse")
                    Text("colapse")
                    Text("colapse")
                }
                .background(Color.blue.opacity(0.5))
            }
            
        }
    }
    
    @ViewBuilder
    var gradientTest: some View {
        HStack(spacing: 0) {
            Circle()
                .strokeBorder(
                    AngularGradient(
                        gradient: Gradient(
                            colors: [
                                .red,
                                .orange,
                                .yellow,
                                .green,
                                .cyan,
                                .blue,
                                .purple,
                                .red,
                            ]
                        ),
                        center: .center,
                        startAngle: .zero,
                        endAngle: .degrees(360)
                    ),
                    lineWidth: 30
                )
                .padding(4)
                .overlay {
                    Rectangle()
                        .fill(
                            AngularGradient(
                                gradient: Gradient(
                                    colors: [
                                        .teal,
                                        .blue,
                                        .indigo,
                                    ]
                                ),
                                center: .center
                            )
                        )
                        .frame(width: 80, height: 80)
                }
            LinearGradient(
                gradient: Gradient(
                    colors: [
                        .white,
                        .yellow,
                        .orange,
                        .red,
                        .black,
                    ]
                ),
                startPoint: .top,
                endPoint: .bottom
            )
            .frame(width: 30)
            .cornerRadius(15)
            .padding(4)
        }
    }
    
}

private struct TestCardView: View {
    
    let width: Float
    let height: Float
    let name: String
    
//    @State private var codeIsHidden = true

//    @ViewBuilder
//    var body: some View {
//        VStack(spacing: 16) {
//            HStack {
//                Text(name.prefix(1).capitalized + name.dropFirst(1))
//                    .font(.title2)
//                    .fontWeight(.thin)
////                Toggle(isOn: $codeIsHidden) {
////                    Button("Show code")
////                }
//            }
//            HStack(spacing: 16) {
//                self.frame(width: width, height: height)
//                Color(white: 0.3)
//                    .frame(width: 1)
//                Image(name)
//                    .resizable()
//                    .frame(width: width, height: height)
//            }
////            let sample = StoneTestViewParser.codeSample(for: name)
////            Text(sample)
////                .font(.caption2)
////                .fontWeight(.light)
////                .monospaced()
////                .padding()
////                .background(Color(hex: "11151D"))
////                .foregroundColor(Color(hex: "9BB9FA"))
////                .cornerRadius(8)
//        }
//        .padding()
//        .cornerRadius(8)
//        .border(.default)
//        .padding(.vertical)
//    }
    
    @ViewBuilder
    var body: some View {
        VStack(spacing: 16) {
            Text(name.prefix(1).capitalized + name.dropFirst(1))
                .font(.title2)
                .fontWeight(.thin)
            HStack(spacing: 16) {
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

extension View {
    
//    @ViewBuilder
//    func testView(width: Float, height: Float, name: String) -> some View {
//        TestCardView(width: width, height: height, name: name)
//    }
    
    @ViewBuilder
    func testView(width: Float, height: Float, name: String) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(name.prefix(1).capitalized + name.dropFirst(1))
                .font(.caption2)
                .fontWeight(.thin)
                .padding(.horizontal)
                .padding(.top, -13)
            HStack(spacing: 16) {
                self.frame(width: width, height: height)
                Color(white: 0.3)
                    .frame(width: 1)
                Image(name)
                    .resizable()
                    .frame(width: width, height: height)
                Color(white: 0.3)
                    .frame(width: 1)
                let sample = StoneTestViewParser.codeSample(for: name)
                ScrollView {
                    Text(sample)
                        .font(.caption2)
                        .fontWeight(.light)
                        .monospaced()
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(width: width * 1.5, height: height)
                .background(Color(hex: "11151D"))
                .foregroundColor(Color(hex: "9BB9FA"))
//                    .cornerRadius(8)
            }
            .padding()
            .cornerRadius(8)
            .border(.default)
        }
        .padding(.vertical)
    }
    
//    @ViewBuilder
//    func testView(width: Float, height: Float, name: String) -> some View {
//        VStack(spacing: 16) {
//            Text(name.prefix(1).capitalized + name.dropFirst(1))
//                .font(.title2)
//                .fontWeight(.thin)
//            HStack(spacing: 16) {
//                self.frame(width: width, height: height)
//                Color(white: 0.3)
//                    .frame(width: 1)
//                Image(name)
//                    .resizable()
//                    .frame(width: width, height: height)
//            }
//        }
//        .padding()
//        .cornerRadius(8)
//        .border(.default)
//        .padding(.vertical)
//    }
    
}
