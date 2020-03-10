//
//  PostsViewController.swift
//  mvp-ios-sample-project
//
//  Created by Marian Fotev on 10/03/2020.
//  Copyright © 2020 Marian Fotev. All rights reserved.
//

import UIKit

final class PostsViewController: LoadableViewController {
    
    // MARK: - Interface builder outlets
    
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Public Properties

    var output: PostsViewOutput?
    
    // MARK: - Private Properties
    
    private let datasource = TableViewDataSource()
}

// MARK: - View lifecycle

extension PostsViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        output?.viewIsReady()
    }
}

// MARK: - PostsViewInput implementation

extension PostsViewController: PostsViewInput {
    
    func update(_ sections: [TableSectionModel]) {
        datasource.sections = sections
        
        tableView.reloadData()
    }
}

extension PostsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output?.cellTapped(at: indexPath)
    }
}

// MARK: - Private functions

private extension PostsViewController {
    
    func setupView() {
        tableView.dataSource = datasource
        tableView.delegate = self
        tableView.registerCell(byType: PostCell.self)
    }
}
