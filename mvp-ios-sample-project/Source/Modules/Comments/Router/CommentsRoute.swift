//
//  CommentsRoute.swift
//  mvp-ios-sample-project
//
//  Created by Marian Fotev on 10/03/2020.
//  Copyright © 2020 Marian Fotev. All rights reserved.
//

protocol CommentsRoute {

    var commentsTransition: Transition { get }
    func openCommentsModule(identifier: Int)
}

extension CommentsRoute where Self: Routable {

    func openCommentsModule(identifier: Int) {
        let controller = AppAssembly.resolver.resolve(CommentsViewController.self, argument: identifier)!
        
        open(controller, transition: commentsTransition)
    }
}
