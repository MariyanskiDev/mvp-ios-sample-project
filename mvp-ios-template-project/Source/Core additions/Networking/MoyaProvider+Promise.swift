//
//  MoyaProvider+Promise.swift
//  mvp-ios-template-project
//
//  Created by Marian Fotev on 10.03.2020.
//  Copyright © 2020 Marian Fotev. All rights reserved.
//

import Foundation
import PromiseKit
import Moya

extension MoyaProvider {
    
    func requestPromise(target: Target,
                        queue: DispatchQueue? = nil,
                        progress: Moya.ProgressBlock? = nil) -> Promise<Moya.Response> {
        let promise: Promise<Moya.Response> = Promise { seal in
            request(target, callbackQueue: queue, progress: progress) { result in
                switch result {
                case let .success(response):
                    seal.fulfill(response)
                case let .failure(error):
                    if error.isCancelled {
                        seal.reject(PMKError.cancelled)
                    } else {
                        seal.reject(error)
                    }
                }
            }
        }
        
        return promise
    }
    
    func requestPromise<T: Decodable>(target: Target,
                                       queue: DispatchQueue? = nil,
                                       progress: Moya.ProgressBlock? = nil) -> Promise<T> {
        return requestPromise(target: target, queue: queue, progress: progress)
            .map { data in
                let filtered = try data.filterSuccessfulStatusAndRedirectCodes()
                if T.self == String.self {
                    return try filtered.mapString() as! T
                } else {
                    return try filtered.map(T.self)
                }
            }
    }
}
