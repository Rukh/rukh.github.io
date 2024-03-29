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
                Group {
                    Text("Что это?").font(.title).padding(.top)
                    Text("Stone Generator – это большая Swift-библиотека, предоставляющая набор UI-элементов с поведением, похожим на SwiftUI. Эта библиотека не имеет зависимостей от системных библиотек Apple и полностью оригинальна. Это не продукт реверс-инжиниринга и не является копией SwiftUI, хоть имеет сходное API.")
                    Text("На данный момент поддерживается ограниченный набор UI-элементов, но даже его уже достаточно для создания простого статичного сайта. Например, этот блог полностью написан с использованием Stone. Исходный код библиотеки закрыт, но вы можете посмотреть .swift файлы этого сайта. 👉 <a href='https://github.com/Rukh/rukh.github.io/tree/main/Source'>Github</a>")
                }
                Group {
                    Text("Как это работает?").font(.title).padding(.top)
                    Text("Основная идея библиотеки – компиляция .swift файлов с описанным UI в набор HTML, CSS, JS файлов. При этом благодаря строгой типизации Swift можно провести ряд оптимизаций и сделать действительно быстрый и компактный сайт. При этом не используются сторонние JS-библиотеки или тяжелые CSS-файлы. Уже в момент компиляции можно построить полное дерево HTML-нод с точно определенным стилем и набором JS-функций. При этом разрешимость этого дерева гарантируется разрешимостью типов.")
                    Text("Другими словами, производительность и скорость сайта в гораздо меньшей степени зависит от того, как вы пишите код. Хорошая аналогия – переход от ассемблера к высокоуровневым языкам программирования. Этот переход сильно упростил разработку, переложив задачу по оптимизации на компилятор.")
                    Text("Технически эта библиотека строит на основе вашего UI-интерфейса граф, оптимизирует его, упрощая структуру, если это возможно, а после строит на его основе HTML-дерево со связанными стилями и javascript функциями.")
                }
//                Group {
//                    Text("Текущий статус").font(.title)
//                    Text("В разработке (пре-альфа)")
//                        .foregroundColor(.green)
//                }
                Group {
                    Text("Pixel Perfect тесты").font(.title).padding(.top)
                    Text("Тут можно увидеть, соотвествует ли сгенерированая верстка сайта дизайну.")
                    HStack(spacing: 16) {
                        Text("Верстка")
                            .font(.title2)
                            .fontWeight(.thin)
                            .frame(width: 250)
                        Color(white: 0.3).frame(width: 1)
                        Text("Ожидаемый дизайн")
                            .font(.title2)
                            .fontWeight(.thin)
                            .frame(width: 250)
                        Color(white: 0.3).frame(width: 1)
                        Text("Код генерирующий этот UI")
                            .font(.title2)
                            .fontWeight(.thin)
                            .frame(width: 250 * 1.5)
                    }
                    .padding(.horizontal)
                    .padding(.top)
//                    Color(white: 0.3).frame(height: 1)
                    StoneTestView()
                    animationTest
                        .padding(.top, 8)
                        .padding(.bottom, 16)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    @ViewBuilder
    var animationTest: some View {
        VStack {
            Text("Shape render & animation test")
                .font(.title2)
                .fontWeight(.thin)
            VStack {
                ForEach(0 ..< 10) { _ in
                    HStack {
                        ForEach(0 ..< 10) { _ in
                            ZStack {
                                ProgressView()
                                Color.yellow
                                    .frame(width: 8, height: 8)
                                    .cornerRadius(4)
                            }
                            .foregroundColor(.allCases.randomElement()!)
                        }
                    }
                }
            }
            .padding()
        }
        .padding()
        .cornerRadius(8)
        .border(.default)
    }
    
}
