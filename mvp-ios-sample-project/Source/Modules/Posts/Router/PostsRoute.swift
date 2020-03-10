//
//  PostsRoute.swift
//  mvp-ios-sample-project
//
//  Created by Marian Fotev on 10/03/2020.
//  Copyright © 2020 Marian Fotev. All rights reserved.
//

protocol PostsRoute {

    var postsTransition: Transition { get }
    func openPostsModule()
}

extension PostsRoute where Self: Routable {

    func openPostsModule() {

    }
}
