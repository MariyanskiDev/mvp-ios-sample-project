//
//  CommentsAssembly.swift
//  mvp-ios-sample-project
//
//  Created by Marian Fotev on 10/03/2020.
//  Copyright © 2020 Marian Fotev. All rights reserved.
//

import UIKit
import Swinject

final class CommentsAssembly: Assembly {

    func assemble(container: Container) {
        registerRouter(container)
        registerPresenter(container)
        registerViewController(container)
    }
}

private extension CommentsAssembly {

    func registerRouter(_ container: Container) {
        container.register(CommentsRouter.self) { _ in
            CommentsRouter()
        }
    }

    func registerPresenter(_ container: Container) {
        container.register(CommentsPresenter.self) { (resolver, identifier: Int) in
            CommentsPresenter(postIdentifier: identifier, service: resolver.resolve(PostsService.self)!)
        }
    }

    func registerViewController(_ container: Container) {
        container.register(CommentsViewController.self) { (resolver, identifier: Int) in
            let view: CommentsViewController = UIStoryboard.viewController()
            let presenter = resolver.resolve(CommentsPresenter.self, argument: identifier)!
            let router = resolver.resolve(CommentsRouter.self)!

            presenter.view = view
            router.view = view
            view.output = presenter

            return view
        }
    }
}
