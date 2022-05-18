//
//  ProjectCard.swift
//  DiG-blog
//
//  Created by Dmitry Gulyagin on 14.05.2022.
//  Copyright © 2022 Globe.tools. All rights reserved.
//

import StoneGenerator

struct ProjectTag: View {
    
    enum Name: String {
        case swift
        case framework
        case game
        case blog
    }
    
    var name: Name
    
    var body: some View {
        Text(name.rawValue.capitalized)
            .font(.caption)
            .padding(.vertical, 2)
            .padding(.horizontal, 6)
            .background {
                switch name {
                case .swift: Color.orange
                case .framework: Color.cyan
                case .game: Color.green
                case .blog: Color.gray
                }
            }
            .cornerRadius(4)
    }
    
}

struct ProjectCard: View {
    
    let title: String
    let tags: [ProjectTag.Name]
    let description: String
    
    var button: BezerPath {
        BezerPath {
            let points = [
                Point(x: 0, y: 1),
                Point(x: 1, y: 0),
                Point(x: 0, y: -1),
            ]
            $0.addPolyline(points)
        }
        .strokeBorder(lineWidth: 3)
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.title)
                HStack {
                    ForEach(tags) { ProjectTag(name: $0) }
                }
                .foregroundColor(.white)
            }
            .frame(width: 150, alignment: .leading)
            Text(description)
                .frame(maxWidth: .infinity, alignment: .leading)
            button
                .frame(width: 10)
        }
        .padding()
//        .background(Color(white: 0.25))
        .cornerRadius(16)
        .foregroundColor(Color.labelText)
        .border(.default)
        .foregroundColor(.labelTextThird)
        .cursor(.pointer)
//        .hoverEffect()
    }
    
}
