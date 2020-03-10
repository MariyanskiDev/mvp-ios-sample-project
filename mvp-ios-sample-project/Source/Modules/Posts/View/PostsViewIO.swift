//
//  PostsViewIO.swift
//  mvp-ios-sample-project
//
//  Created by Marian Fotev on 10/03/2020.
//  Copyright © 2020 Marian Fotev. All rights reserved.
//

import UIKit

typealias PostsView = PostsViewInput & LoadingPresentable

protocol PostsViewOutput {
    func viewIsReady()
    func cellTapped(at indexPath: IndexPath)
}

protocol PostsViewInput: class {
    func update(_ sections: [TableSectionModel])
}
