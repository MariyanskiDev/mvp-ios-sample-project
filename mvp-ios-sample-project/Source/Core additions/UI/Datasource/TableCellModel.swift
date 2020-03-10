//
//  TableViewCellModel.swift
//  mvp-ios-sample-project
//
//  Created by Marian Fotev on 10/03/2020.
//  Copyright © 2020 Marian Fotev. All rights reserved.
//

import UIKit

struct TableSectionModel {
    
    var title: String
    var items: [TableCellModel]
    
    init(title: String = "", items: [TableCellModel]) {
        self.title = title
        self.items = items
    }
}

protocol TableCellModel {
    var delegate: Any? { get }
    
    func cell(tableView: UITableView) -> UITableViewCell
}

extension TableCellModel {
    
    var delegate: Any? {
        return nil
    }
}
