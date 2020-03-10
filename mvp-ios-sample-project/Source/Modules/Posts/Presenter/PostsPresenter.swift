//
//  PostsPresenter.swift
//  mvp-ios-sample-project
//
//  Created by Marian Fotev on 10/03/2020.
//  Copyright © 2020 Marian Fotev. All rights reserved.
//

final class PostsPresenter {

    // MARK: Public properties

    weak var view: PostsViewInput?
    var router: PostsRouter?
    var output: PostsModuleOutput?
}

// MARK: - PostsViewOutput

extension PostsPresenter: PostsViewOutput {

    func viewIsReady() {

    }
}
