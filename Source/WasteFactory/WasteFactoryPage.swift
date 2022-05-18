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
                Text("Что это?").font(.title)
                Text("Waste Factory – это игра про переработку мусора. На начальном этапе доступна лишь сортировка, и то в ручном режиме. При получении валюты открываются новые улучшения, в том числе и автоматическое оборудование для фабрики.")
                Text("Скриншоты").font(.title)
                HStack() {
                    let imageHeight: Float = 600
                    Image("waste_factory_1.jpg")
                        .resizable()
                        .background {
                            Color(white: 0.97)
                            ProgressView()
                        }
                        .frame(width: 0.462 * imageHeight, height: imageHeight)
                    Image("waste_factory_2.jpg")
                        .resizable()
                        .background {
                            Color(white: 0.97)
                            ProgressView()
                        }
                        .frame(width: 0.462 * imageHeight, height: imageHeight)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
    
}
