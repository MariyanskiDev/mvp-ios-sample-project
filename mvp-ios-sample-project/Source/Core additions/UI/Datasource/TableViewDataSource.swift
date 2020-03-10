//
//  TableViewDataSource.swift
//  mvp-ios-sample-project
//
//  Created by Marian Fotev on 10/03/2020.
//  Copyright © 2020 Marian Fotev. All rights reserved.
//

import UIKit

final class TableViewDataSource: NSObject {
    
    var sections: [TableSectionModel] = []
    
    private let skeletonCellType: UITableViewCell.Type?
    
    init(skeletonCellType: UITableViewCell.Type? = nil) {
        self.skeletonCellType = skeletonCellType
    }
}

extension TableViewDataSource {
    
    func deleteItem(indexPath: IndexPath) {
        sections[indexPath.section].items.remove(at: indexPath.row)
    }
}

// MARK: - UITableViewDataSource implementation

extension TableViewDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = sections[optional: section]?.items.count else {
            return 0
        }
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let section = sections[optional: indexPath.section],
            let item = section.items[optional: indexPath.row] else {
                return UITableViewCell()
        }
        
        return item.cell(tableView: tableView)
    }
}
