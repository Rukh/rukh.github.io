//
//  WasteFactoryPage.swift
//  DiG-blog
//
//  Created by Dmitry Gulyagin on 17.05.2022.
//  Copyright © 2022 Globe.tools. All rights reserved.
//

import StoneGenerator

public struct WasteFactoryPage: Page {
    
    public let uri: URI = .path("waste-factory") // my NIO server capability
    
    public var body: some View {
        GlobalView(currentPage: .wasteFactory) {
            VStack(alignment: .leading) {
                Text("Что это?").font(.title).padding(.top)
                Text("Waste Factory – это игра про переработку мусора. На начальном этапе доступна лишь сортировка, и то в ручном режиме. При получении валюты открываются новые улучшения, в том числе и автоматическое оборудование для фабрики.")
                Text("Скриншоты").font(.title).padding(.top)
                HStack(spacing: 20) {
                    screenshotImage("waste_factory_1")
                    screenshotImage("waste_factory_2")
                }
                Spacer()
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    @ViewBuilder
    func screenshotImage(_ name: String) -> some View {
        let imageHeight: Float = 600
        Image(name)
            .resizable()
            .frame(width: 0.462 * imageHeight, height: imageHeight)
            .background {
                Color(white: 0.97)
                ProgressView()
            }
            .cornerRadius(16)
    }
    
}
