//
//  Blog.swift
//  DiG-blog
//
//  Created by Dmitry Gulyagin on 04.05.2022.
//  Copyright © 2022 Globe.tools. All rights reserved.
//

import StoneGenerator

public struct DiGBlog: StoneWebsite { // my NIO server capability
    
    public static var home = HomePage()
    public static var pageNotFound = HomePage()
    
    public static let version = Version(major: 1)
    
}

public extension Page {
    var pageName: String { "DiG Blog" }
}
