//
//  CommentsPresenter.swift
//  mvp-ios-sample-project
//
//  Created by Marian Fotev on 10/03/2020.
//  Copyright © 2020 Marian Fotev. All rights reserved.
//

final class CommentsPresenter {

    // MARK: Public properties

    weak var view: CommentsView?
    var router: CommentsRouter?
    
    // MARK: Dependencies
    
    private let postIdentifier: Int
    private let service: PostsService
    
    // MARK: Constructor
    
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
        view?.didChangeLoadingState(true)
        
        service.getComments(id: String(postIdentifier))
        .done { comments in
            self.updateSections(comments)
        }
        .ensure {
            self.view?.didChangeLoadingState(false)
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
