//
//  PostCell.swift
//  mvp-ios-sample-project
//
//  Created by Fotev Marian on 10.03.2020.
//  Copyright © 2020 Marian Fotev. All rights reserved.
//

import UIKit

final class PostCell: UITableViewCell {
    
    struct Model: TableCellModel {
        let title: String
        let body: String
        
        func cell(tableView: UITableView) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(byType: PostCell.self)
            cell.configure(with: self)
            return cell
        }
    }

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var bodyLabel: UILabel!
}

extension PostCell {
    
    func configure(with model: Model) {
        titleLabel.text = model.title
        bodyLabel.text = model.body
    }
}
