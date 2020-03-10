//
//  PostsPresenter.swift
//  mvp-ios-sample-project
//
//  Created by Marian Fotev on 10/03/2020.
//  Copyright © 2020 Marian Fotev. All rights reserved.
//

import UIKit

final class PostsPresenter {

    // MARK: Public properties

    weak var view: PostsViewInput?
    var router: PostsRouter?
    
    // MARK: Private properties
    
    private var posts: [Post] = []
    
    // MARK: Dependencies
    
    private let service: PostsService
    
    // MARK: Constructor
    
    init(service: PostsService) {
        self.service = service
    }
}

// MARK: - PostsViewOutput

extension PostsPresenter: PostsViewOutput {

    func viewIsReady() {
        loadPosts()
    }
    
    func cellTapped(at indexPath: IndexPath) {
        guard let post = posts[optional: indexPath.row] else {
            return
        }
        
        router?.openCommentsModule(identifier: post.id)
    }
}

private extension PostsPresenter {
    
    func loadPosts() {
        service.getPosts()
            .done { posts in
                self.posts = posts
                self.updateSections(posts)
            }
            .catch { error in
                print(error.localizedDescription)
            }
    }
    
    func updateSections(_ posts: [Post]) {
        let viewModels = posts.map { PostCell.Model(title: $0.title, body: $0.body) }
        
        view?.update([TableSectionModel(items: viewModels)])
    }
}
