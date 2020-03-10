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
}

private extension PostsPresenter {
    
    func loadPosts() {
        service.getPosts()
            .done { posts in
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
