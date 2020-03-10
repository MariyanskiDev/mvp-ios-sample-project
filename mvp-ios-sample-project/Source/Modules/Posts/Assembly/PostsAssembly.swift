//
//  PostsAssembly.swift
//  mvp-ios-sample-project
//
//  Created by Marian Fotev on 10/03/2020.
//  Copyright © 2020 Marian Fotev. All rights reserved.
//

import UIKit
import Swinject

final class PostsAssembly: Assembly {

    func assemble(container: Container) {
        registerRouter(container)
        registerPresenter(container)
        registerViewController(container)
    }
}

private extension PostsAssembly {

    func registerRouter(_ container: Container) {
        container.register(PostsRouter.self) { _ in
            PostsRouter()
        }
    }

    func registerPresenter(_ container: Container) {
        container.register(PostsPresenter.self) { _ in
            PostsPresenter()
        }
    }

    func registerViewController(_ container: Container) {
        container.register(PostsViewController.self) { (resolver, moduleOutput: PostsModuleOutput) in
            let view: PostsViewController = UIStoryboard.viewController()
            let presenter = resolver.resolve(PostsPresenter.self)!
            let router = resolver.resolve(PostsRouter.self)!

            presenter.view = view
            presenter.output = moduleOutput
            router.view = view
            view.output = presenter

            return view
        }
    }
    
    func registerViewControllerFromStoryboard(_ container: Container) {
        container.storyboardInitCompleted(PostsViewController.self) { (resolver, view) in
            let presenter = resolver.resolve(PostsPresenter.self)!
            let router = resolver.resolve(PostsRouter.self)!
            
            presenter.view = view
            presenter.router = router
            router.view = view
            view.output = presenter
        }
    }
}
