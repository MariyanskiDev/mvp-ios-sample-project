//
//  CommentsViewIO.swift
//  mvp-ios-sample-project
//
//  Created by Marian Fotev on 10/03/2020.
//  Copyright © 2020 Marian Fotev. All rights reserved.
//

typealias CommentsView = CommentsViewInput & LoadingPresentable

protocol CommentsViewOutput {
    func viewIsReady()
}

protocol CommentsViewInput: class {
     func update(_ sections: [TableSectionModel])
}
