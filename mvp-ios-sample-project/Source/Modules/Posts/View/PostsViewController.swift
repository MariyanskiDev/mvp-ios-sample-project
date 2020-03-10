//
//  PostsViewController.swift
//  mvp-ios-sample-project
//
//  Created by Marian Fotev on 10/03/2020.
//  Copyright © 2020 Marian Fotev. All rights reserved.
//

import UIKit

final class PostsViewController: UIViewController {

    // MARK: - Properties

    var output: PostsViewOutput?
}

// MARK: - View lifecycle

extension PostsViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        output?.viewIsReady()
    }
}

// MARK: - PostsViewInput implementation

extension PostsViewController: PostsViewInput {

}
