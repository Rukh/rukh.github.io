//
//  StoneTestViewParser.swift
//  DiG-blog
//
//  Created by Dmitry Gulyagin on 15.08.2022.
//  Copyright © 2022 Globe.tools. All rights reserved.
//

import Foundation

actor StoneTestViewParser {
    
    static private var blocks: [String: String] = [:]
    
    static func codeSample(for blockName: String, in filePath: String = #filePath) -> String {
        if blocks.isEmpty {
            let file = try! String(contentsOfFile: filePath)
            generateBlocks(from: file)
        }
        return blocks[blockName]!
    }
    
    private static func generateBlocks(from file: String) {
        var bracesCounter = 0 // Ignore first bracer
        var block: [Substring] = []
        var name = ""
        var offset = 0
        for line in file.split(whereSeparator: { $0.isNewline }) {
            if bracesCounter == 0, line.contains("var") {
                let regexp = try! NSRegularExpression(pattern: #"var ([\w\d]+): some View \{"#)
                let line = String(line)
                let fullRange = NSRange(location: 0, length: line.count)
                guard let match = regexp.firstMatch(in: line, range: fullRange) else { continue }
                let result = match.range(at: 1)
                let range = Range(result, in: line)!
                offset = line.prefix(while: { $0.isWhitespace }).count + 4
                name = String(line[range])
                bracesCounter += 1
                continue
            } else if bracesCounter == 0 {
                continue
            }
            if line.contains("{") { bracesCounter += 1 }
            if line.contains("}") { bracesCounter -= 1 }
            if bracesCounter == 0 {
                self.blocks[name] = block.joined(separator: "\n")
                block = []
                name = ""
            } else {
                block.append(line.dropFirst(offset))
            }
        }
    }

}
