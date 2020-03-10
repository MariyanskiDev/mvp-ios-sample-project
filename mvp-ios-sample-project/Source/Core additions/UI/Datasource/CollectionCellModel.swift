//
//  CollectionCellModel.swift
//  mvp-ios-sample-project
//
//  Created by Marian Fotev on 10/03/2020.
//  Copyright © 2020 Marian Fotev. All rights reserved.
//

import UIKit

struct CollectionSectionModel {
    
    let title: String
    let items: [CollectionCellModel]
    
    init(title: String = "", items: [CollectionCellModel]) {
        self.title = title
        self.items = items
    }
}

protocol CollectionCellModel {
    
    func cell(collectionView: UICollectionView, for indexPath: IndexPath) -> UICollectionViewCell
}
