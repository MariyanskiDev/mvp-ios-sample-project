//
//  PostsEndpoint.swift
//  mvp-ios-template-project
//
//  Created by Fotev Marian on 10.03.2020.
//  Copyright © 2020 Marian Fotev. All rights reserved.
//

import Moya

enum PostsEndpoint {
    case getPosts
    case getComments(id: String)
}

extension PostsEndpoint: DefaultTargetType {
    
    var parameters: [String : Any] {
        return [:]
    }
    
    var path: String {
        switch self {
        case .getPosts:
            return "/posts"
        case let .getComments(id: id):
            return "/posts/\(id)/comments"
        }
    }
    
    var method: Method {
        return .get
    }
}
