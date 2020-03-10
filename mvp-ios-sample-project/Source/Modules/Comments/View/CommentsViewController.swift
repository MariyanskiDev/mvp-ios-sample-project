//
//  CommentsViewController.swift
//  mvp-ios-sample-project
//
//  Created by Marian Fotev on 10/03/2020.
//  Copyright © 2020 Marian Fotev. All rights reserved.
//

import UIKit

final class CommentsViewController: UIViewController {

    // MARK: - Interface builder outlets
    
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Public Properties

    var output: CommentsViewOutput?
    
    // MARK: - Private Properties
    
    private let datasource = TableViewDataSource()
}

// MARK: - View lifecycle

extension CommentsViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        output?.viewIsReady()
    }
}

// MARK: - CommentsViewInput implementation

extension CommentsViewController: CommentsViewInput {
    
    func update(_ sections: [TableSectionModel]) {
        datasource.sections = sections
        
        tableView.reloadData()
    }
}

// MARK: - Private functions

private extension CommentsViewController {
    
    func setupView() {
        tableView.dataSource = datasource
        tableView.registerCell(byType: CommentCell.self)
    }
}
