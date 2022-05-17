//
//  StoneGeneratorPage.swift
//  DiG-blog
//
//  Created by Dmitry Gulyagin on 17.05.2022.
//  Copyright © 2022 Globe.tools. All rights reserved.
//

import StoneGenerator

public struct StoneGeneratorPage: Page {
    
    public let uri: URI = .path("stone-generator") // my NIO server capability
    
    public var body: some View {
        GlobalView(currentPage: .stoneGenerator) {
            VStack(alignment: .leading) {
                Text("Что это?").font(.title)
                Text("Stone Generator – это большая Swift библиотека предоставляющая набор UI элементов с поведением похожим на SwiftUI. Эта библиотека не имеет зависимостей от системных Apple библиотек и полностью оригинальна. Это не продукт реверс инжиниринга и не является копией SwiftUI, хоть имеет сходное API")
                Text("На данный момент поддерживается ограниченный набор UI элементов, но даже его уже достаточно для создание простого статичного сайта. Например этот блог полностью написан с использованием Stone. Исходный код библиотеки закрыт, но вы можете посмотреть .swift файлы этого сайта.")
                Text("Как это работает?").font(.title)
                Text("Основная идея библиотеки – компиляция .swift файлов с описанным UI в набор HTML, CSS, JS файлов. При этом благодаря строгой типизации Swift можно провести ряд оптимизаций и сделать действительно быстрый и компактный сайт. При этом не используются сторонние JS библиотеки или тяжелые CSS файлы. Уже в момент компиляции можно построить полное дерево HTML нод с точно определенным стилем и набором JS функций. При этом разрешимость этого дерева гарантируется разрешимостью типов.")
                Text("Другими словами производительность и скорость сайта в гораздо меньшей степени зависит от того как вы пишите код. Хорошая аналогия – переход от ассемблера к высокоуровневым языкам программирования. Этот переход сильно упростил разработку переложив задачу по оптимизации на компилятор.")
                Text("Технически эта библиотека строит на основе вашего UI-интерфейса граф, оптимизирует его – упрощая структуру если это возможно, а после – строит на его основе HTML дерево со связанными стилями и javascript функциями")
                HStack(alignment: .firstTextBaseline) {
                    Text("Текущий статус").font(.title)
                    Text("–").font(.title)
                    Text("в разработке (пре-альфа)").font(.title3)
                        .fontWeight(.black)
                        .foregroundColor(.green)
                }
                Text("Визуальные тесты").font(.title) //  на ожидаемое поведение
                test
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    @ViewBuilder
    var test: some View {
        HStack(alignment: .bottom, spacing: 40) {
            fontTest
            VStack {
                ForEach(0 ..< 5) { _ in
                    ProgressView()
                }
            }
            paddingTest
        }
        .padding(30)
        .background(Color(white: 0.97))
    }
    
    @ViewBuilder
    var paddingTest: some View {
        Text("Test")
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
    
}
