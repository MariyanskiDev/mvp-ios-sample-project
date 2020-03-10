//
//  PostsService.swift
//  mvp-ios-template-project
//
//  Created by Fotev Marian on 10.03.2020.
//  Copyright © 2020 Marian Fotev. All rights reserved.
//

import PromiseKit
import Moya
import Swinject

final class PostsServiceAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(PostsService.self) { _ in
            MoyaPostsService(provider: .default())
        }
    }
}

protocol PostsService {
    
    func getPosts() -> Promise<[Post]>
    func getComments(id: String) -> Promise<[Comment]>
}

private final class MoyaPostsService {
    
    private let provider: MoyaProvider<PostsEndpoint>
    
    init(provider: MoyaProvider<PostsEndpoint>) {
        self.provider = provider
    }
}

extension MoyaPostsService: PostsService {
    
    func getPosts() -> Promise<[Post]> {
        return provider.requestPromise(target: .getPosts)
    }
    
    func getComments(id: String) -> Promise<[Comment]> {
        return provider.requestPromise(target: .getComments(id: id))
    }
}
