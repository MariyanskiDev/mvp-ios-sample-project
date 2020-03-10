//
//  CommentsPresenter.swift
//  mvp-ios-sample-project
//
//  Created by Marian Fotev on 10/03/2020.
//  Copyright © 2020 Marian Fotev. All rights reserved.
//

final class CommentsPresenter {

    // MARK: Public properties

    weak var view: CommentsViewInput?
    var router: CommentsRouter?
    
    private let postIdentifier: Int
    private let service: PostsService
    
    init(postIdentifier: Int, service: PostsService) {
        self.postIdentifier = postIdentifier
        self.service = service
    }
}

// MARK: - CommentsViewOutput

extension CommentsPresenter: CommentsViewOutput {

    func viewIsReady() {
        loadComments()
    }
}

private extension CommentsPresenter {
    
    func loadComments() {
        service.getComments(id: String(postIdentifier))
            .done { comments in
                self.updateSections(comments)
            }
            .catch { error in
                print(error.localizedDescription)
            }
    }
    
    func updateSections(_ comments: [Comment]) {
        let viewModels = comments.map { CommentCell.Model(name: $0.name, email: $0.email, body: $0.body) }

        view?.update([TableSectionModel(items: viewModels)])
    }
}
