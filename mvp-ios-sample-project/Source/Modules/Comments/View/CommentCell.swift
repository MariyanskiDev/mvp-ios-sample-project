//
//  CommentCell.swift
//  mvp-ios-sample-project
//
//  Created by Fotev Marian on 10.03.2020.
//  Copyright © 2020 Marian Fotev. All rights reserved.
//

import UIKit

final class CommentCell: UITableViewCell {
    
    struct Model: TableCellModel {
        let name: String
        let email: String
        let body: String
        
        func cell(tableView: UITableView) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(byType: CommentCell.self)
            cell.configure(with: self)
            return cell
        }
    }

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var bodyLabel: UILabel!
}

extension CommentCell {
    
    func configure(with model: Model) {
        nameLabel.text = model.name
        emailLabel.text = model.email
        bodyLabel.text = model.body
    }
}
