//
//  PostsRouter.swift
//  mvp-ios-sample-project
//
//  Created by Marian Fotev on 10/03/2020.
//  Copyright © 2020 Marian Fotev. All rights reserved.
//

final class PostsRouter: Router<PostsViewController>, CommentsRoute {
    let commentsTransition: Transition = PushTransition()
}
