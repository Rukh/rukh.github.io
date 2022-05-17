//
//  EmojiCameraPage.swift
//  DiG-blog
//
//  Created by Dmitry Gulyagin on 17.05.2022.
//  Copyright © 2022 Globe.tools. All rights reserved.
//

import StoneGenerator

struct EmojiCameraPage: Page {
    
    public let uri: URI = .path("emoji-camera") // my NIO server capability

    @ViewBuilder
    var body: some View {
        GlobalView(currentPage: .emojiCamera) {
            VStack(alignment: .leading) {
                Text("Что это?").font(.title)
                Text("Это приложение которое в реальном времени берет видеопоток с камеры телефона и каждый кадр разбивается на мозаику из юникод символов. Символы подбираются из заданного набора - ascii символы, китайские или emoji.")
                Text("Каждый символ подбирается так, чтобы его цвет соответствовал части исходной картинки.")
                Text("Например").font(.title)
                HStack(alignment: .bottom) {
                    VStack {
                        let sizeString = textImageSize(EmojiiCameraPhoto.macbook)
                        Text(EmojiiCameraPhoto.macbook)
                            .font(.custom(size: 3, fontFamily: .monospace))
                            .lineSpacing(4.3)
//                            .tracking(0.5)
                            .background(.black)
                        Text("Мой macbock в emoji символах. \(sizeString) символа.")
                            .font(.footnote)
                    }
                    VStack {
                        let sizeString = textImageSize(EmojiiCameraPhoto.photo)
                        Text(EmojiiCameraPhoto.photo)
                            .font(.custom(size: 5, fontFamily: .monospace))
                            .lineSpacing(5.5)
                            .tracking(2.5)
                            .background(.black)
                            .foregroundColor(.white)
                        Text("Селфи в ASCII символах. \(sizeString) символа.")
                            .font(.footnote)
                    }
                }
                VStack {
                    let sizeString = textImageSize(EmojiiCameraPhoto.pot)
                    Text(EmojiiCameraPhoto.pot)
                        .font(.custom(size: 10, fontFamily: .monospace))
                        .lineSpacing(11)
                        .background(.black)
                        .foregroundColor(.white)
                    Text("Кружечка, китайский сегмент unicode. \(sizeString) символа.")
                        .font(.footnote)
//                    Text("Качество лучше из за более точной аппроксимации цвета.")
//                        .font(.footnote)
                }
            }
        }
    }
    
    private func textImageSize(_ image: String) -> String {
        let split = image
            .split{ $0.isNewline }
            .map { $0.count as Int }
        let (quotient, remainder) = split.reduce(0, +).quotientAndRemainder(dividingBy: split.count)
        let width = quotient + (remainder > 0 ? 1 : 0)
        let height = split.count
        return "\(width) x \(height)"
    }
    
}
