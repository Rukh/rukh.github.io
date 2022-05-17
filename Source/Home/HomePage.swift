//
//  HomePage.swift
//  DiG-blog
//
//  Created by Dmitry Gulyagin on 04.05.2022.
//  Copyright © 2022 Globe.tools. All rights reserved.
//

import StoneGenerator

public struct HomePage: Page {
    
    public let uri: URI = .empty // my NIO server capability
    
    public var body: some View {
        GlobalView(currentPage: .home) {
            VStack {
                header
                projectCards
                myCard
            }
        }
    }
    
    @ViewBuilder
    private var header: some View {
        VStack(alignment: .leading, spacing: 45) {
            Text("iOS, Swift, Gamedev...")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("... и всякие другие странные и интересные штуки в моем блоге")
                .font(.subheadline)
                .fontWeight(.bold)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(45)
        .foregroundColor(.white)
        .background {
//            Color.labelTextSecond
            Image("code.jpg")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Color(white: 0, opacity: 0.75)
        }
        .cornerRadius(15)
        .frame(height: 200)
    }
    
    
    @ViewBuilder
    private var projectCards: some View {
        VStack(alignment: .leading) {
            ProjectCard(
                title: "DiG Blog",
                tags: [.swift, .blog],
                description: "Имено этот блог вы сейчас и читаете ☺️. Здесь собраны технические статьи на различные темы, связанные с разработкой для iOS, а также Swift и Metal."
            )
            .onTapGesture(present: BlogPage())
            ProjectCard(
                title: "Stone Generator",
                tags: [.swift, .framework],
                description: "Это один из самых интересных проектов для разработки. Основная цель проекта - создание фреймворка, который позволяет написать серверное приложение для генерации и менджмента веб-приложений. Он имеет похожий на SwiftUI синтаксис и тот же набор стандартных UI-элементов. К слову, этот сайт сгенерирован именно им."
            )
            .onTapGesture(present: StoneGeneratorPage())
            ProjectCard(
                title: "Waste factory",
                tags: [.blog, .game],
                description: "Это небольшая мобильная игра про переработку мусора и автоматизацию этого процеса."
            )
            .onTapGesture(present: WasteFactoryPage())
            ProjectCard(
                title: "Emoji Camera",
                tags: [.swift],
                description: "Это небольшое приложение позволяет в реальном времени превращать кадры с камеры в набор юникод символов. На данный момент поддерживаются наборы ascii, emoji и китайских символов."
            )
            .onTapGesture(present: EmojiCameraPage())
        }
        .foregroundColor(.labelText)
    }
    
    @ViewBuilder
    private var myCard: some View {
        HStack(alignment: .center) {
            Image("selfie.jpg")
                .resizable()
                .background {
                    Color(white: 0.97)
                    ProgressView()
                }
                .frame(width: 70, height: 90)
                .cornerRadius(8)
            Text("Меня зовут Дмитрий Гулягин, и уже больше 5 лет я занимаюсь iOS разработкой. В этом блоге я расказываю о своих pet-проектах и пишу технические статьи про iOS, SwiftUI и Metal шейдеры. Обратная связь - <a href='https://t.me/roxot'>@Roxot</a>, буду рад вашему фидбеку 🙂.")
        }
        .frame(width: 600)
        .padding()
        .border(Border(color: .labelTextFourth))
        .cornerRadius(16)
        .frame(maxWidth: .infinity, alignment: .center)
        .foregroundColor(.labelTextSecond)
    }
    
}

extension Color {
    
    static var blue = Color(hex: "0577FF")
    static var green = Color(hex: "34C859")

}
